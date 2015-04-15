# Install script for directory: C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/FLTK")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/FL" TYPE FILE FILES
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/dirent.h"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Enumerations.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/filename.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Adjuster.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/fl_ask.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Bitmap.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_BMP_Image.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Box.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Browser.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Browser_.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Chart.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Check_Browser.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Check_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Choice.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Clock.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Color_Chooser.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Counter.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Dial.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Double_Window.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/fl_draw.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Export.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_File_Browser.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_File_Chooser.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_File_Icon.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_File_Input.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Fill_Dial.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Fill_Slider.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Float_Input.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_FormsBitmap.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_FormsPixmap.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Free.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_GIF_Image.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Gl_Window.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Group.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Help_Dialog.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Help_View.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Hold_Browser.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Hor_Fill_Slider.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Hor_Nice_Slider.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Hor_Slider.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Hor_Value_Slider.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Image.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Input.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Input_.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Input_Choice.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Int_Input.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_JPEG_Image.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Light_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Line_Dial.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Menu.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Menu_.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Menu_Bar.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Menu_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Menu_Item.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Menu_Window.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/fl_message.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Multiline_Input.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Multiline_Output.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Multi_Browser.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Multi_Label.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Nice_Slider.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Object.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Output.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Overlay_Window.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Pack.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Pixmap.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_PNG_Image.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_PNM_Image.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Positioner.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Preferences.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Progress.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Radio_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Radio_Light_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Radio_Round_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Repeat_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Return_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_RGB_Image.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Roller.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Round_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Round_Clock.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Scroll.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Scrollbar.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Secret_Input.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Select_Browser.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Shared_Image.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/fl_show_colormap.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/fl_show_input.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Simple_Counter.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Single_Window.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Slider.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Spinner.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Sys_Menu_Bar.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Tabs.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Text_Buffer.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Text_Display.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Text_Editor.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Tile.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Tiled_Image.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Timer.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Toggle_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Toggle_Light_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Toggle_Round_Button.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Tooltip.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Valuator.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Value_Input.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Value_Output.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Value_Slider.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Widget.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Window.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_Wizard.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_XBM_Image.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/Fl_XPM_Image.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/forms.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/gl.h"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/gl2opengl.h"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/glu.h"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/glut.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/gl_draw.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/mac.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/mac.r"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/math.h"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/names.h"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/win32.H"
    "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/FL/x.H"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/FLTK-1.1" TYPE FILE FILES "C:/Users/Oleksandr/Desktop/Pinocchio_source/fltk-1.1.10/CMake/FLTKUse.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/FLTK-1.1" TYPE FILE FILES "C:/Users/Oleksandr/Desktop/Pinocchio_source/cmake-3.2.1-win32-x86/bin/FLTKBuildSettings.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/FLTK-1.1" TYPE FILE FILES "C:/Users/Oleksandr/Desktop/Pinocchio_source/cmake-3.2.1-win32-x86/bin/FLTKLibraryDepends.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/FLTK-1.1" TYPE FILE FILES "C:/Users/Oleksandr/Desktop/Pinocchio_source/cmake-3.2.1-win32-x86/bin/CMake/FLTKConfig.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/Users/Oleksandr/Desktop/Pinocchio_source/cmake-3.2.1-win32-x86/bin/zlib/cmake_install.cmake")
  include("C:/Users/Oleksandr/Desktop/Pinocchio_source/cmake-3.2.1-win32-x86/bin/jpeg/cmake_install.cmake")
  include("C:/Users/Oleksandr/Desktop/Pinocchio_source/cmake-3.2.1-win32-x86/bin/png/cmake_install.cmake")
  include("C:/Users/Oleksandr/Desktop/Pinocchio_source/cmake-3.2.1-win32-x86/bin/src/cmake_install.cmake")
  include("C:/Users/Oleksandr/Desktop/Pinocchio_source/cmake-3.2.1-win32-x86/bin/fluid/cmake_install.cmake")
  include("C:/Users/Oleksandr/Desktop/Pinocchio_source/cmake-3.2.1-win32-x86/bin/test/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/Users/Oleksandr/Desktop/Pinocchio_source/cmake-3.2.1-win32-x86/bin/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
