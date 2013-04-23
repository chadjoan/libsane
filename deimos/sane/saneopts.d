/* sane - Scanner Access Now Easy.
   Copyright (C) 1996, 1997 David Mosberger-Tang and Andreas Beck
   This file is part of the SANE package.

   SANE is free software; you can redistribute it and/or modify it under
   the terms of the GNU General Public License as published by the Free
   Software Foundation; either version 2 of the License, or (at your
   option) any later version.

   SANE is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
   for more details.

   You should have received a copy of the GNU General Public License
   along with sane; see the file COPYING.  If not, write to the Free
   Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

   As a special exception, the authors of SANE give permission for
   additional uses of the libraries contained in this release of SANE.

   The exception is that, if you link a SANE library with other files
   to produce an executable, this does not by itself cause the
   resulting executable to be covered by the GNU General Public
   License.  Your use of that executable is in no way restricted on
   account of linking the SANE library code into it.

   This exception does not, however, invalidate any other reasons why
   the executable file might be covered by the GNU General Public
   License.

   If you submit changes to SANE to the maintainers to be included in
   a subsequent release, you agree by submitting the changes that
   those changes may be distributed with this exception intact.

   If you write modifications of your own for SANE, it is your choice
   whether to permit this exception to apply to your modifications.
   If you do not wish that, delete this exception notice.

   This file declares common option names, titles, and descriptions.  A
   backend is not limited to these options but for the sake of
   consistency it's better to use options declared here when appropriate.
*/

/* This file defines several option NAMEs, TITLEs and DESCs
   that are (or should be) used by several backends.

   All well known options should be listed here. But this does
   not mean that all options that are listed here are well known options.
   To find out if an option is a well known option and how well known
   options have to be defined please take a look at the sane standard!!!
 */

module deimos.sane.saneopts;

pure nothrow SANE_I18N(string text) { return text; }


/* This _must_ be the first option (index 0): */
enum SANE_NAME_NUM_OPTIONS = "";   /* never settable */

/* The common option groups */
enum SANE_NAME_STANDARD         = "standard";
enum SANE_NAME_GEOMETRY         = "geometry";
enum SANE_NAME_ENHANCEMENT      = "enhancement";
enum SANE_NAME_ADVANCED         = "advanced";
enum SANE_NAME_SENSORS          = "sensors";

enum SANE_NAME_PREVIEW          = "preview";
enum SANE_NAME_GRAY_PREVIEW     = "preview-in-gray";
enum SANE_NAME_BIT_DEPTH        = "depth";
enum SANE_NAME_SCAN_MODE        = "mode";
enum SANE_NAME_SCAN_SPEED       = "speed";
enum SANE_NAME_SCAN_SOURCE      = "source";
enum SANE_NAME_BACKTRACK        = "backtrack";
/* Most user-interfaces will let the user specify the scan area as the
   top-left corner and the width/height of the scan area.  The reason
   the backend interface uses the top-left/bottom-right corner is so
   that the scan area values can be properly constraint independent of
   any other option value.  */
enum SANE_NAME_SCAN_TL_X        = "tl-x";
enum SANE_NAME_SCAN_TL_Y        = "tl-y";
enum SANE_NAME_SCAN_BR_X        = "br-x";
enum SANE_NAME_SCAN_BR_Y        = "br-y";
enum SANE_NAME_SCAN_RESOLUTION  = "resolution";
enum SANE_NAME_SCAN_X_RESOLUTION    = "x-resolution";
enum SANE_NAME_SCAN_Y_RESOLUTION    = "y-resolution";
enum SANE_NAME_PAGE_WIDTH       = "page-width";
enum SANE_NAME_PAGE_HEIGHT      = "page-height";
enum SANE_NAME_CUSTOM_GAMMA     = "custom-gamma";
enum SANE_NAME_GAMMA_VECTOR     = "gamma-table";
enum SANE_NAME_GAMMA_VECTOR_R   = "red-gamma-table";
enum SANE_NAME_GAMMA_VECTOR_G   = "green-gamma-table";
enum SANE_NAME_GAMMA_VECTOR_B   = "blue-gamma-table";
enum SANE_NAME_BRIGHTNESS       = "brightness";
enum SANE_NAME_CONTRAST     = "contrast";
enum SANE_NAME_GRAIN_SIZE       = "grain";
enum SANE_NAME_HALFTONE     = "halftoning";
enum SANE_NAME_BLACK_LEVEL           = "black-level";
enum SANE_NAME_WHITE_LEVEL           = "white-level";
enum SANE_NAME_WHITE_LEVEL_R         = "white-level-r";
enum SANE_NAME_WHITE_LEVEL_G         = "white-level-g";
enum SANE_NAME_WHITE_LEVEL_B         = "white-level-b";
enum SANE_NAME_SHADOW       = "shadow";
enum SANE_NAME_SHADOW_R     = "shadow-r";
enum SANE_NAME_SHADOW_G     = "shadow-g";
enum SANE_NAME_SHADOW_B     = "shadow-b";
enum SANE_NAME_HIGHLIGHT        = "highlight";
enum SANE_NAME_HIGHLIGHT_R      = "highlight-r";
enum SANE_NAME_HIGHLIGHT_G      = "highlight-g";
enum SANE_NAME_HIGHLIGHT_B      = "highlight-b";
enum SANE_NAME_HUE          = "hue";
enum SANE_NAME_SATURATION       = "saturation";
enum SANE_NAME_FILE         = "filename";
enum SANE_NAME_HALFTONE_DIMENSION   = "halftone-size";
enum SANE_NAME_HALFTONE_PATTERN = "halftone-pattern";
enum SANE_NAME_RESOLUTION_BIND  = "resolution-bind";
enum SANE_NAME_NEGATIVE     = "negative";
enum SANE_NAME_QUALITY_CAL      = "quality-cal";
enum SANE_NAME_DOR          = "double-res";
enum SANE_NAME_RGB_BIND     = "rgb-bind";
enum SANE_NAME_THRESHOLD        = "threshold";
enum SANE_NAME_ANALOG_GAMMA     = "analog-gamma";
enum SANE_NAME_ANALOG_GAMMA_R   = "analog-gamma-r";
enum SANE_NAME_ANALOG_GAMMA_G   = "analog-gamma-g";
enum SANE_NAME_ANALOG_GAMMA_B   = "analog-gamma-b";
enum SANE_NAME_ANALOG_GAMMA_BIND    = "analog-gamma-bind";
enum SANE_NAME_WARMUP       = "warmup";
enum SANE_NAME_CAL_EXPOS_TIME   = "cal-exposure-time";
enum SANE_NAME_CAL_EXPOS_TIME_R = "cal-exposure-time-r";
enum SANE_NAME_CAL_EXPOS_TIME_G = "cal-exposure-time-g";
enum SANE_NAME_CAL_EXPOS_TIME_B = "cal-exposure-time-b";
enum SANE_NAME_SCAN_EXPOS_TIME  = "scan-exposure-time";
enum SANE_NAME_SCAN_EXPOS_TIME_R    = "scan-exposure-time-r";
enum SANE_NAME_SCAN_EXPOS_TIME_G    = "scan-exposure-time-g";
enum SANE_NAME_SCAN_EXPOS_TIME_B    = "scan-exposure-time-b";
enum SANE_NAME_SELECT_EXPOSURE_TIME = "select-exposure-time";
enum SANE_NAME_CAL_LAMP_DEN     = "cal-lamp-density";
enum SANE_NAME_SCAN_LAMP_DEN        = "scan-lamp-density";
enum SANE_NAME_SELECT_LAMP_DENSITY  = "select-lamp-density";
enum SANE_NAME_LAMP_OFF_AT_EXIT = "lamp-off-at-exit";

/* well known options from 'SENSORS' group*/
enum SANE_NAME_SCAN         = "scan";
enum SANE_NAME_EMAIL            = "email";
enum SANE_NAME_FAX          = "fax";
enum SANE_NAME_COPY         = "copy";
enum SANE_NAME_PDF          = "pdf";
enum SANE_NAME_CANCEL       = "cancel";
enum SANE_NAME_PAGE_LOADED      = "page-loaded";
enum SANE_NAME_COVER_OPEN       = "cover-open";

enum SANE_TITLE_NUM_OPTIONS     = SANE_I18N("Number of options");

enum SANE_TITLE_STANDARD        = SANE_I18N("Standard");
enum SANE_TITLE_GEOMETRY        = SANE_I18N("Geometry");
enum SANE_TITLE_ENHANCEMENT     = SANE_I18N("Enhancement");
enum SANE_TITLE_ADVANCED        = SANE_I18N("Advanced");
enum SANE_TITLE_SENSORS         = SANE_I18N("Sensors");

enum SANE_TITLE_PREVIEW     = SANE_I18N("Preview");
enum SANE_TITLE_GRAY_PREVIEW        = SANE_I18N("Force monochrome preview");
enum SANE_TITLE_BIT_DEPTH       = SANE_I18N("Bit depth");
enum SANE_TITLE_SCAN_MODE       = SANE_I18N("Scan mode");
enum SANE_TITLE_SCAN_SPEED      = SANE_I18N("Scan speed");
enum SANE_TITLE_SCAN_SOURCE     = SANE_I18N("Scan source");
enum SANE_TITLE_BACKTRACK       = SANE_I18N("Force backtracking");
enum SANE_TITLE_SCAN_TL_X       = SANE_I18N("Top-left x");
enum SANE_TITLE_SCAN_TL_Y       = SANE_I18N("Top-left y");
enum SANE_TITLE_SCAN_BR_X       = SANE_I18N("Bottom-right x");
enum SANE_TITLE_SCAN_BR_Y       = SANE_I18N("Bottom-right y");
enum SANE_TITLE_SCAN_RESOLUTION = SANE_I18N("Scan resolution");
enum SANE_TITLE_SCAN_X_RESOLUTION   = SANE_I18N("X-resolution");
enum SANE_TITLE_SCAN_Y_RESOLUTION   = SANE_I18N("Y-resolution");
enum SANE_TITLE_PAGE_WIDTH          = SANE_I18N("Page width");
enum SANE_TITLE_PAGE_HEIGHT         = SANE_I18N("Page height");
enum SANE_TITLE_CUSTOM_GAMMA        = SANE_I18N("Use custom gamma table");
enum SANE_TITLE_GAMMA_VECTOR        = SANE_I18N("Image intensity");
enum SANE_TITLE_GAMMA_VECTOR_R  = SANE_I18N("Red intensity");
enum SANE_TITLE_GAMMA_VECTOR_G  = SANE_I18N("Green intensity");
enum SANE_TITLE_GAMMA_VECTOR_B  = SANE_I18N("Blue intensity");
enum SANE_TITLE_BRIGHTNESS      = SANE_I18N("Brightness");
enum SANE_TITLE_CONTRAST        = SANE_I18N("Contrast");
enum SANE_TITLE_GRAIN_SIZE      = SANE_I18N("Grain size");
enum SANE_TITLE_HALFTONE        = SANE_I18N("Halftoning");
enum SANE_TITLE_BLACK_LEVEL          = SANE_I18N("Black level");
enum SANE_TITLE_WHITE_LEVEL          = SANE_I18N("White level");
enum SANE_TITLE_WHITE_LEVEL_R        = SANE_I18N("White level for red");
enum SANE_TITLE_WHITE_LEVEL_G        = SANE_I18N("White level for green");
enum SANE_TITLE_WHITE_LEVEL_B        = SANE_I18N("White level for blue");
enum SANE_TITLE_SHADOW      = SANE_I18N("Shadow");
enum SANE_TITLE_SHADOW_R        = SANE_I18N("Shadow for red");
enum SANE_TITLE_SHADOW_G        = SANE_I18N("Shadow for green");
enum SANE_TITLE_SHADOW_B        = SANE_I18N("Shadow for blue");
enum SANE_TITLE_HIGHLIGHT       = SANE_I18N("Highlight");
enum SANE_TITLE_HIGHLIGHT_R     = SANE_I18N("Highlight for red");
enum SANE_TITLE_HIGHLIGHT_G     = SANE_I18N("Highlight for green");
enum SANE_TITLE_HIGHLIGHT_B     = SANE_I18N("Highlight for blue");
enum SANE_TITLE_HUE         = SANE_I18N("Hue");
enum SANE_TITLE_SATURATION      = SANE_I18N("Saturation");
enum SANE_TITLE_FILE            = SANE_I18N("Filename");
enum SANE_TITLE_HALFTONE_DIMENSION  = SANE_I18N("Halftone pattern size");
enum SANE_TITLE_HALFTONE_PATTERN    = SANE_I18N("Halftone pattern");
enum SANE_TITLE_RESOLUTION_BIND = SANE_I18N("Bind X and Y resolution");
enum SANE_TITLE_NEGATIVE        = SANE_I18N("Negative");
enum SANE_TITLE_QUALITY_CAL     = SANE_I18N("Quality calibration");
enum SANE_TITLE_DOR         = SANE_I18N("Double Optical Resolution");
enum SANE_TITLE_RGB_BIND        = SANE_I18N("Bind RGB");
enum SANE_TITLE_THRESHOLD       = SANE_I18N("Threshold");
enum SANE_TITLE_ANALOG_GAMMA        = SANE_I18N("Analog gamma correction");
enum SANE_TITLE_ANALOG_GAMMA_R  = SANE_I18N("Analog gamma red");
enum SANE_TITLE_ANALOG_GAMMA_G  = SANE_I18N("Analog gamma green");
enum SANE_TITLE_ANALOG_GAMMA_B  = SANE_I18N("Analog gamma blue");
enum SANE_TITLE_ANALOG_GAMMA_BIND    = SANE_I18N("Bind analog gamma");
enum SANE_TITLE_WARMUP      = SANE_I18N("Warmup lamp");
enum SANE_TITLE_CAL_EXPOS_TIME  = SANE_I18N("Cal. exposure-time");
enum SANE_TITLE_CAL_EXPOS_TIME_R    = SANE_I18N("Cal. exposure-time for red");
enum SANE_TITLE_CAL_EXPOS_TIME_G    = SANE_I18N("Cal. exposure-time for green");
enum SANE_TITLE_CAL_EXPOS_TIME_B    = SANE_I18N("Cal. exposure-time for blue");
enum SANE_TITLE_SCAN_EXPOS_TIME = SANE_I18N("Scan exposure-time");
enum SANE_TITLE_SCAN_EXPOS_TIME_R   = SANE_I18N("Scan exposure-time for red");
enum SANE_TITLE_SCAN_EXPOS_TIME_G   = SANE_I18N("Scan exposure-time for green");
enum SANE_TITLE_SCAN_EXPOS_TIME_B   = SANE_I18N("Scan exposure-time for blue");
enum SANE_TITLE_SELECT_EXPOSURE_TIME    = SANE_I18N("Set exposure-time");
enum SANE_TITLE_CAL_LAMP_DEN        = SANE_I18N("Cal. lamp density");
enum SANE_TITLE_SCAN_LAMP_DEN   = SANE_I18N("Scan lamp density");
enum SANE_TITLE_SELECT_LAMP_DENSITY = SANE_I18N("Set lamp density");
enum SANE_TITLE_LAMP_OFF_AT_EXIT    = SANE_I18N("Lamp off at exit");

/* well known options from 'SENSORS' group*/
enum SANE_TITLE_SCAN            = "Scan button";
enum SANE_TITLE_EMAIL       = "Email button";
enum SANE_TITLE_FAX         = "Fax button";
enum SANE_TITLE_COPY            = "Copy button";
enum SANE_TITLE_PDF         = "PDF button";
enum SANE_TITLE_CANCEL      = "Cancel button";
enum SANE_TITLE_PAGE_LOADED     = "Page loaded";
enum SANE_TITLE_COVER_OPEN      = "Cover open";

/* Descriptive/help strings for above options: */
enum SANE_DESC_NUM_OPTIONS = SANE_I18N("Read-only option that specifies how many options a specific devices supports.");

enum SANE_DESC_STANDARD    = SANE_I18N("Source, mode and resolution options");
enum SANE_DESC_GEOMETRY    = SANE_I18N("Scan area and media size options");
enum SANE_DESC_ENHANCEMENT = SANE_I18N("Image modification options");
enum SANE_DESC_ADVANCED    = SANE_I18N("Hardware specific options");
enum SANE_DESC_SENSORS     = SANE_I18N("Scanner sensors and buttons");

enum SANE_DESC_PREVIEW = SANE_I18N("Request a preview-quality scan.");

enum SANE_DESC_GRAY_PREVIEW = SANE_I18N("Request that all previews are done in monochrome mode.  On a three-pass scanner this cuts down the number of passes to one and on a one-pass scanner, it reduces the memory requirements and scan-time of the preview.");

enum SANE_DESC_BIT_DEPTH = SANE_I18N("Number of bits per sample, typical values are 1 for \"line-art\" and 8 for multibit scans.");

enum SANE_DESC_SCAN_MODE = SANE_I18N("Selects the scan mode (e.g., lineart, monochrome, or color).");

enum SANE_DESC_SCAN_SPEED = SANE_I18N("Determines the speed at which the scan proceeds.");

enum SANE_DESC_SCAN_SOURCE = SANE_I18N("Selects the scan source (such as a document-feeder).");

enum SANE_DESC_BACKTRACK = SANE_I18N("Controls whether backtracking is forced.");

enum SANE_DESC_SCAN_TL_X = SANE_I18N("Top-left x position of scan area.");

enum SANE_DESC_SCAN_TL_Y = SANE_I18N("Top-left y position of scan area.");

enum SANE_DESC_SCAN_BR_X = SANE_I18N("Bottom-right x position of scan area.");

enum SANE_DESC_SCAN_BR_Y = SANE_I18N("Bottom-right y position of scan area.");

enum SANE_DESC_SCAN_RESOLUTION = SANE_I18N("Sets the resolution of the scanned image.");

enum SANE_DESC_SCAN_X_RESOLUTION = SANE_I18N("Sets the horizontal resolution of the scanned image.");

enum SANE_DESC_SCAN_Y_RESOLUTION = SANE_I18N("Sets the vertical resolution of the scanned image.");

enum SANE_DESC_PAGE_WIDTH = SANE_I18N("Specifies the width of the media.  Required for automatic centering of sheet-fed scans.");

enum SANE_DESC_PAGE_HEIGHT = SANE_I18N("Specifies the height of the media.");

enum SANE_DESC_CUSTOM_GAMMA = SANE_I18N("Determines whether a builtin or a custom gamma-table should be used.");

enum SANE_DESC_GAMMA_VECTOR = SANE_I18N("Gamma-correction table.  In color mode this option equally affects the red, green, and blue channels simultaneously (i.e., it is an intensity gamma table).");

enum SANE_DESC_GAMMA_VECTOR_R = SANE_I18N("Gamma-correction table for the red band.");

enum SANE_DESC_GAMMA_VECTOR_G = SANE_I18N("Gamma-correction table for the green band.");

enum SANE_DESC_GAMMA_VECTOR_B = SANE_I18N("Gamma-correction table for the blue band.");

enum SANE_DESC_BRIGHTNESS = SANE_I18N("Controls the brightness of the acquired image.");

enum SANE_DESC_CONTRAST = SANE_I18N("Controls the contrast of the acquired image.");

enum SANE_DESC_GRAIN_SIZE = SANE_I18N("Selects the \"graininess\" of the acquired image.  Smaller values result in sharper images.");

enum SANE_DESC_HALFTONE = SANE_I18N("Selects whether the acquired image should be halftoned (dithered).");

enum SANE_DESC_BLACK_LEVEL = SANE_I18N("Selects what radiance level should be considered \"black\".");

enum SANE_DESC_WHITE_LEVEL = SANE_I18N("Selects what radiance level should be considered \"white\".");

enum SANE_DESC_WHITE_LEVEL_R = SANE_I18N("Selects what red radiance level should be considered \"white\".");

enum SANE_DESC_WHITE_LEVEL_G = SANE_I18N("Selects what green radiance level should be considered \"white\".");

enum SANE_DESC_WHITE_LEVEL_B = SANE_I18N("Selects what blue radiance level should be considered \"white\".");

enum SANE_DESC_SHADOW = SANE_I18N("Selects what radiance level should be considered \"black\".");
enum SANE_DESC_SHADOW_R = SANE_I18N("Selects what red radiance level should be considered \"black\".");
enum SANE_DESC_SHADOW_G = SANE_I18N("Selects what green radiance level should be considered \"black\".");
enum SANE_DESC_SHADOW_B = SANE_I18N("Selects what blue radiance level should be considered \"black\".");

enum SANE_DESC_HIGHLIGHT = SANE_I18N("Selects what radiance level should be considered \"white\".");
enum SANE_DESC_HIGHLIGHT_R = SANE_I18N("Selects what red radiance level should be considered \"full red\".");
enum SANE_DESC_HIGHLIGHT_G = SANE_I18N("Selects what green radiance level should be considered \"full green\".");
enum SANE_DESC_HIGHLIGHT_B = SANE_I18N("Selects what blue radiance level should be considered \"full blue\".");

enum SANE_DESC_HUE = SANE_I18N("Controls the \"hue\" (blue-level) of the acquired image.");

enum SANE_DESC_SATURATION = SANE_I18N("The saturation level controls the amount of \"blooming\" that occurs when acquiring an image with a camera. Larger values cause more blooming.");

enum SANE_DESC_FILE = SANE_I18N("The filename of the image to be loaded.");

enum SANE_DESC_HALFTONE_DIMENSION = SANE_I18N("Sets the size of the halftoning (dithering) pattern used when scanning halftoned images.");

enum SANE_DESC_HALFTONE_PATTERN = SANE_I18N("Defines the halftoning (dithering) pattern for scanning halftoned images.");

enum SANE_DESC_RESOLUTION_BIND = SANE_I18N("Use same values for X and Y resolution");
enum SANE_DESC_NEGATIVE = SANE_I18N("Swap black and white");
enum SANE_DESC_QUALITY_CAL = SANE_I18N("Do a quality white-calibration");
enum SANE_DESC_DOR = SANE_I18N("Use lens that doubles optical resolution");
enum SANE_DESC_RGB_BIND = SANE_I18N("In RGB-mode use same values for each color");
enum SANE_DESC_THRESHOLD = SANE_I18N("Select minimum-brightness to get a white point");
enum SANE_DESC_ANALOG_GAMMA = SANE_I18N("Analog gamma-correction");
enum SANE_DESC_ANALOG_GAMMA_R = SANE_I18N("Analog gamma-correction for red");
enum SANE_DESC_ANALOG_GAMMA_G = SANE_I18N("Analog gamma-correction for green");
enum SANE_DESC_ANALOG_GAMMA_B = SANE_I18N("Analog gamma-correction for blue");
enum SANE_DESC_ANALOG_GAMMA_BIND = SANE_I18N("In RGB-mode use same values for each color");
enum SANE_DESC_WARMUP = SANE_I18N("Warmup lamp before scanning");
enum SANE_DESC_CAL_EXPOS_TIME = SANE_I18N("Define exposure-time for calibration");
enum SANE_DESC_CAL_EXPOS_TIME_R = SANE_I18N("Define exposure-time for red calibration");
enum SANE_DESC_CAL_EXPOS_TIME_G = SANE_I18N("Define exposure-time for green calibration");
enum SANE_DESC_CAL_EXPOS_TIME_B = SANE_I18N("Define exposure-time for blue calibration");
enum SANE_DESC_SCAN_EXPOS_TIME = SANE_I18N("Define exposure-time for scan");
enum SANE_DESC_SCAN_EXPOS_TIME_R = SANE_I18N("Define exposure-time for red scan");
enum SANE_DESC_SCAN_EXPOS_TIME_G = SANE_I18N("Define exposure-time for green scan");
enum SANE_DESC_SCAN_EXPOS_TIME_B = SANE_I18N("Define exposure-time for blue scan");
enum SANE_DESC_SELECT_EXPOSURE_TIME = SANE_I18N("Enable selection of exposure-time");
enum SANE_DESC_CAL_LAMP_DEN = SANE_I18N("Define lamp density for calibration");
enum SANE_DESC_SCAN_LAMP_DEN = SANE_I18N("Define lamp density for scan");
enum SANE_DESC_SELECT_LAMP_DENSITY = SANE_I18N("Enable selection of lamp density");
enum SANE_DESC_LAMP_OFF_AT_EXIT = SANE_I18N("Turn off lamp when program exits");

/* well known options from 'SENSORS' group*/
enum SANE_DESC_SCAN     = SANE_I18N("Scan button");
enum SANE_DESC_EMAIL        = SANE_I18N("Email button");
enum SANE_DESC_FAX      = SANE_I18N("Fax button");
enum SANE_DESC_COPY     = SANE_I18N("Copy button");
enum SANE_DESC_PDF      = SANE_I18N("PDF button");
enum SANE_DESC_CANCEL   = SANE_I18N("Cancel button");
enum SANE_DESC_PAGE_LOADED  = SANE_I18N("Page loaded");
enum SANE_DESC_COVER_OPEN   = SANE_I18N("Cover open");

/* Typical values for stringlists (to keep the backends consistent) */
enum SANE_VALUE_SCAN_MODE_COLOR     = SANE_I18N("Color");
enum SANE_VALUE_SCAN_MODE_COLOR_LINEART = SANE_I18N("Color Lineart");
enum SANE_VALUE_SCAN_MODE_COLOR_HALFTONE     = SANE_I18N("Color Halftone");
enum SANE_VALUE_SCAN_MODE_GRAY      = SANE_I18N("Gray");
enum SANE_VALUE_SCAN_MODE_HALFTONE           = SANE_I18N("Halftone");
enum SANE_VALUE_SCAN_MODE_LINEART       = SANE_I18N("Lineart");

