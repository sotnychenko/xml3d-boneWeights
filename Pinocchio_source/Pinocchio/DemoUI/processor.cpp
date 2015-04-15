/*
Copyright (c) 2007 Ilya Baran

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

#include "FL/fl_ask.H"
#include <fstream>

#include "processor.h"
#include "../Pinocchio/skeleton.h"
#include "../Pinocchio/utils.h"
#include "../Pinocchio/debugging.h"
#include "../Pinocchio/attachment.h"
#include "../Pinocchio/pinocchioApi.h"
#include "defmesh.h"
#include "motion.h"
#include "Jzon.h"

struct ArgData
{
    ArgData() :
        stopAtMesh(false), stopAfterCircles(false), skelScale(1.), noFit(false),
        skeleton(HumanSkeleton())
    {
    }
    
    bool stopAtMesh;
    bool stopAfterCircles;
    string filename;
    string motionname;
    Quaternion<> meshTransform;
    double skelScale;
    bool noFit;
    Skeleton skeleton;
    string skeletonname;
};

void printUsageAndExit()
{
    cout << "Usage: DemoUI filename.{obj | ply | off | gts | stl}" << endl;
    cout << "              [-skel skelname] [-rot x y z deg]* [-scale s]" << endl;
    cout << "              [-meshonly | -mo] [-circlesonly | -co]" << endl;
    cout << "              [-motion motionname] [-nofit]" << endl;

    exit(0);
}

ArgData processArgs(const vector<string> &args)
{
    ArgData out;
    int cur = 2;
    int num = args.size();
    if(num < 2)
        printUsageAndExit();

    out.filename = args[1];
    
    while(cur < num) {
        string curStr = args[cur++];
        if(curStr == string("-skel")) {
            if(cur == num) {
                cout << "No skeleton specified; ignoring." << endl;
                continue;
            }
            curStr = args[cur++];
            if(curStr == string("human"))
                out.skeleton = HumanSkeleton();
            else if(curStr == string("horse"))
                out.skeleton = HorseSkeleton();
            else if(curStr == string("quad"))
                out.skeleton = QuadSkeleton();
            else if(curStr == string("centaur"))
                out.skeleton = CentaurSkeleton();
            else
                out.skeleton = FileSkeleton(curStr);
            out.skeletonname = curStr;
            continue;
        }
        if(curStr == string("-rot")) {
            if(cur + 3 >= num) {
                cout << "Too few rotation arguments; exiting." << endl;
                printUsageAndExit();
            }
            double x, y, z, deg;
            sscanf(args[cur++].c_str(), "%lf", &x);
            sscanf(args[cur++].c_str(), "%lf", &y);
            sscanf(args[cur++].c_str(), "%lf", &z);
            sscanf(args[cur++].c_str(), "%lf", &deg);
            
            out.meshTransform = Quaternion<>(Vector3(x, y, z), deg * M_PI / 180.) * out.meshTransform;
            continue;
        }
        if(curStr == string("-scale")) {
            if(cur >= num) {
                cout << "No scale provided; exiting." << endl;
                printUsageAndExit();
            }
            sscanf(args[cur++].c_str(), "%lf", &out.skelScale);
            continue;
        }
        if(curStr == string("-meshonly") || curStr == string("-mo")) {
            out.stopAtMesh = true;
            continue;
        }
        if(curStr == string("-circlesonly") || curStr == string("-co")) {
            out.stopAfterCircles = true;
            continue;
        }
        if(curStr == string("-nofit")) {
            out.noFit = true;
            continue;
        }
        if(curStr == string("-motion")) {
            if(cur == num) {
                cout << "No motion filename specified; ignoring." << endl;
                continue;
            }
            out.motionname = args[cur++];
            continue;
        }
        cout << "Unrecognized option: " << curStr << endl;
        printUsageAndExit();
    }

    return out;
}


Vector<size_t,-1> ordered(Vector<double,-1> const& values) {
	std::vector<size_t> indices(values.size());
	std::iota(begin(indices), end(indices), static_cast<size_t>(0));

	std::sort(
		begin(indices), end(indices),
		[&](size_t a, size_t b) { return values[a] > values[b]; }
	);
	return indices;
}

void process(const vector<string> &args, MyWindow *w)
{
    int i;
    ArgData a = processArgs(args);

    Debugging::setOutStream(cout);

    Mesh m(a.filename);
    if(m.vertices.size() == 0) {
        cout << "Error reading file.  Aborting." << endl;
        exit(0);
        return;
    }            
	Jzon::Array  arrayPosition;

	for (i = 0; i < (int)m.vertices.size(); ++i)
	{
		m.vertices[i].pos = a.meshTransform * m.vertices[i].pos;
		arrayPosition.Add(m.vertices[i].pos[0]);
		arrayPosition.Add(m.vertices[i].pos[1]);
		arrayPosition.Add(m.vertices[i].pos[2]);

	}
    
    m.normalizeBoundingBox();
    m.computeVertexNormals();

    Skeleton given = a.skeleton;
    given.scale(a.skelScale * 0.7);

    if(a.stopAtMesh) { //if early bailout
        w->addMesh(new StaticDisplayMesh(m));
        return;
    }

    PinocchioOutput o;
    if(!a.noFit) { //do everything
        o = autorig(given, m);
    }
    else { //skip the fitting step--assume the skeleton is already correct for the mesh
        TreeType *distanceField = constructDistanceField(m);
        VisTester<TreeType> *tester = new VisTester<TreeType>(distanceField);

        o.embedding = a.skeleton.fGraph().verts;
        for(i = 0; i < (int)o.embedding.size(); ++i)
            o.embedding[i] = m.toAdd + o.embedding[i] * m.scale;

        o.attachment = new Attachment(m, a.skeleton, o.embedding, tester);

        delete tester;
        delete distanceField;
    }

    if(o.embedding.size() == 0) {
        cout << "Error embedding" << endl;
        exit(0);
    }

    if(a.motionname.size() > 0) {
        w->addMesh(new DefMesh(m, given, o.embedding, *(o.attachment), new Motion(a.motionname)));
    }
    else {
        w->addMesh(new StaticDisplayMesh(m));

        for(i = 1; i < (int)o.embedding.size(); ++i)
        {
            w->addLine(LineSegment(o.embedding[i], o.embedding[given.fPrev()[i]], Vector3(.5, .5, 0), 4.));
        }
    }

    //output skeleton embedding
    for(i = 0; i < (int)o.embedding.size(); ++i)
        o.embedding[i] = (o.embedding[i] - m.toAdd) / m.scale;
    ofstream os("skeleton.out");
    for(i = 0; i < (int)o.embedding.size(); ++i) {
        os << i << " " << o.embedding[i][0] << " " << o.embedding[i][1] <<
                   " " << o.embedding[i][2] << " " << a.skeleton.fPrev()[i] << endl;
    }

    //output attachment
 //   std::ofstream astrm("attachment.out");

 

	Jzon::Object root;
	root.Add("format", "xml3d-json");
	root.Add("version", "0.4.0");

	Jzon::Object data;
	Jzon::Object boneWeight;
	Jzon::Object boneIdx;
	Jzon::Object boneParent;
	Jzon::Object inverseBindPose;
	Jzon::Object translation;
	Jzon::Object normal;
	Jzon::Object position;
	Jzon::Object index;

	boneWeight.Add("type", "float4");
	boneIdx.Add("type", "int4");
	boneParent.Add("type", "int");
	inverseBindPose.Add("type", "float4x4");
	translation.Add("type", "float3");
	normal.Add("type", "float3");
	position.Add("type", "float3");
	index.Add("type", "int");

	Jzon::Array  seqBoneWeight;
	Jzon::Array  seqBoneIdx;
	Jzon::Array  seqBoneParent;
	Jzon::Array  seqInverseBindPose;
	Jzon::Array  seqTranslation;
	Jzon::Array  seqNormal;
	Jzon::Array  seqPosition;
	Jzon::Array  seqIndex;
	
	Jzon::Object  valBoneWeight;
	Jzon::Object  valBoneIdx;
	Jzon::Object  valBoneParent;
	Jzon::Object  valInverseBindPose;
	Jzon::Object  valTranslation;
	Jzon::Object  valNormal;
	Jzon::Object  valPosition;
	Jzon::Object  valIndex;

	Jzon::Array  arrayBoneWeight;
	Jzon::Array  arrayBoneIdx;
	Jzon::Array  arrayBoneParent;
	Jzon::Array  arrayInverseBindPose;
	Jzon::Array  arrayTranslation;
	Jzon::Array  arrayNormal;

	Jzon::Array  arrayIndex;


	

	for (i = 0; i < (int)m.edges.size(); ++i) {
		int v = m.edges[i].vertex;
		arrayIndex.Add(v);
		
	}

	for (i = 0; i < (int)m.vertices.size(); ++i) {
		Vector<double, -1> v = o.attachment->getWeights(i);
		Vector<size_t, -1> indices = ordered(v);
		

		arrayNormal.Add(m.vertices[i].normal[0]);
		arrayNormal.Add(m.vertices[i].normal[1]);
		arrayNormal.Add(m.vertices[i].normal[2]);


		arrayTranslation.Add((double) 0.0);
		arrayTranslation.Add((double) 0.0);
		arrayTranslation.Add((double) 0.0);

		double sum = 0;
		for (int j = 0; j < 4; ++j) {
			double d = floor(0.5 + v[indices[j]] * 10000.) / 10000.;
			sum += d;
			v[indices[j]] = d;
		}


		for (int j = 0; j < 4; ++j){
			arrayBoneWeight.Add(floor(0.5 + (v[indices[j]] / sum)* 10000.) / 10000.);
			arrayBoneIdx.Add((int)indices[j]);
		}
	}

	
		
	for (i = 0; i < (int)o.embedding.size(); ++i) {
		arrayInverseBindPose.Add((double) 1.0);
		arrayInverseBindPose.Add((double) 0.0);
		arrayInverseBindPose.Add((double) 0.0);
		arrayInverseBindPose.Add((double) 0.0);

		arrayInverseBindPose.Add((double) 0.0);
		arrayInverseBindPose.Add((double) 1.0);
		arrayInverseBindPose.Add((double) 0.0);
		arrayInverseBindPose.Add((double) 0.0);

		arrayInverseBindPose.Add((double) 0.0);
		arrayInverseBindPose.Add((double) 0.0);
		arrayInverseBindPose.Add((double) 1.0);
		arrayInverseBindPose.Add((double) 0.0);

		//arrayInverseBindPose.Add(-1.0*o.embedding[i][0]);
		//arrayInverseBindPose.Add(-1.0*o.embedding[i][1]);
		//arrayInverseBindPose.Add(-1.0*o.embedding[i][2]);
		//arrayInverseBindPose.Add((double) 1.0);
		arrayInverseBindPose.Add((double) 0.0);
		arrayInverseBindPose.Add((double) 0.0);
		arrayInverseBindPose.Add((double) 0.0);
		arrayInverseBindPose.Add((double) 1.0);

		arrayBoneParent.Add(a.skeleton.fPrev()[i]);		
	}
	

	valBoneWeight.Add("value", arrayBoneWeight);
	seqBoneWeight.Add(valBoneWeight);
	boneWeight.Add("seq", seqBoneWeight);

	valBoneIdx.Add("value", arrayBoneIdx);
	seqBoneIdx.Add(valBoneIdx);
	boneIdx.Add("seq", seqBoneIdx);

	valBoneParent.Add("value", arrayBoneParent);
	seqBoneParent.Add(valBoneParent);
	boneParent.Add("seq", seqBoneParent);

	valInverseBindPose.Add("value", arrayInverseBindPose);
	seqInverseBindPose.Add(valInverseBindPose);
	inverseBindPose.Add("seq", seqInverseBindPose);

	valTranslation.Add("value", arrayTranslation);
	seqTranslation.Add(valTranslation);
	translation.Add("seq", seqTranslation);

	valNormal.Add("value", arrayNormal);
	seqNormal.Add(valNormal);
	normal.Add("seq", seqNormal);

	valPosition.Add("value", arrayPosition);
	seqPosition.Add(valPosition);
	position.Add("seq", seqPosition);

	valIndex.Add("value", arrayIndex);
	seqIndex.Add(valIndex);
	index.Add("seq", seqIndex);


	data.Add("boneParent", boneParent);
	data.Add("inverseBindPose", inverseBindPose);
	data.Add("boneWeight", boneWeight);
	data.Add("boneIdx", boneIdx);
	data.Add("translation", translation);
	data.Add("normal", normal);
	data.Add("position", position);
	data.Add("index", index);
	root.Add("data", data);
	
	

	Jzon::FileWriter::WriteFile("data.json", root, Jzon::StandardFormat);
	
  //  delete o.attachment;
}
