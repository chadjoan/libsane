/* sane - Scanner Access Now Easy.  (D binding)
   Copyright (C) 1997-1999 David Mosberger-Tang and Andreas Beck
   This file is part of the SANE package.

   This file is in the public domain.  You may use and modify it as
   you see fit, as long as this copyright message is included and
   that there is an indication as to what modifications have been
   made (if any).

   SANE is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
   FITNESS FOR A PARTICULAR PURPOSE.

   This file declares SANE application interface.  See the SANE
   standard for a detailed explanation of the interface.

   D binding translated by Chad Joan*/

module deimos.sane.sane;

/*
 * SANE types and defines
 */

alias ubyte SANE_Byte;
alias int   SANE_Word;
alias SANE_Word  SANE_Bool;
alias SANE_Word  SANE_Int;
alias char  SANE_Char;
alias SANE_Char* SANE_String;
alias const(SANE_Char)* SANE_String_Const;
alias void* SANE_Handle;
alias SANE_Word SANE_Fixed;

enum SANE_CURRENT_MAJOR	= 1;
enum SANE_CURRENT_MINOR	= 0;

pure nothrow SANE_Word SANE_VERSION_CODE(SANE_Word major, SANE_Word minor, SANE_Word build)
{
    return
        ( ((major &   0xff) << 24)
        | ((minor &   0xff) << 16)
        | ((build & 0xffff) <<  0));
}

pure nothrow SANE_Word SANE_VERSION_MAJOR(SANE_Word code) { return (code >> 24) &   0xff; }
pure nothrow SANE_Word SANE_VERSION_MINOR(SANE_Word code) { return (code >> 16) &   0xff; }
pure nothrow SANE_Word SANE_VERSION_BUILD(SANE_Word code) { return (code >>  0) & 0xffff; }

enum SANE_FALSE	= 0;
enum SANE_TRUE	= 1;

enum SANE_FIXED_SCALE_SHIFT	= 16;
pure nothrow SANE_Fixed SANE_FIX(T)(T v) { return v * (1 << SANE_FIXED_SCALE_SHIFT); }
pure nothrow double SANE_UNFIX(SANE_Fixed v) { return (cast(double)v) / (1 << SANE_FIXED_SCALE_SHIFT); }

enum SANE_Status
{
    SANE_STATUS_GOOD = 0,       /* everything A-OK */
    SANE_STATUS_UNSUPPORTED,    /* operation is not supported */
    SANE_STATUS_CANCELLED,      /* operation was cancelled */
    SANE_STATUS_DEVICE_BUSY,    /* device is busy; try again later */
    SANE_STATUS_INVAL,          /* data is invalid (includes no dev at open) */
    SANE_STATUS_EOF,            /* no more data available (end-of-file) */
    SANE_STATUS_JAMMED,         /* document feeder jammed */
    SANE_STATUS_NO_DOCS,        /* document feeder out of documents */
    SANE_STATUS_COVER_OPEN,     /* scanner cover is open */
    SANE_STATUS_IO_ERROR,       /* error during device I/O */
    SANE_STATUS_NO_MEM,         /* out of memory */
    SANE_STATUS_ACCESS_DENIED   /* access to resource has been denied */
}

enum SANE_Value_Type
{
    SANE_TYPE_BOOL = 0,
    SANE_TYPE_INT,
    SANE_TYPE_FIXED,
    SANE_TYPE_STRING,
    SANE_TYPE_BUTTON,
    SANE_TYPE_GROUP
}

enum SANE_Unit
{
    SANE_UNIT_NONE = 0,		/* the value is unit-less (e.g., # of scans) */
    SANE_UNIT_PIXEL,		/* value is number of pixels */
    SANE_UNIT_BIT,		/* value is number of bits */
    SANE_UNIT_MM,		/* value is millimeters */
    SANE_UNIT_DPI,		/* value is resolution in dots/inch */
    SANE_UNIT_PERCENT,		/* value is a percentage */
    SANE_UNIT_MICROSECOND	/* value is micro seconds */
}

struct SANE_Device
{
    SANE_String_Const name;	/* unique device name */
    SANE_String_Const vendor;	/* device vendor string */
    SANE_String_Const model;	/* device model name */
    SANE_String_Const type;	/* device type (e.g., "flatbed scanner") */
}

enum SANE_Capability : SANE_Int
{
    SANE_CAP_SOFT_SELECT = (1 << 0),
    SANE_CAP_HARD_SELECT = (1 << 1),
    SANE_CAP_SOFT_DETECT = (1 << 2),
    SANE_CAP_EMULATED    = (1 << 3),
    SANE_CAP_AUTOMATIC   = (1 << 4),
    SANE_CAP_INACTIVE    = (1 << 5),
    SANE_CAP_ADVANCED    = (1 << 6),
}

pure nothrow SANE_Bool SANE_OPTION_IS_ACTIVE(SANE_Int cap)   { return (cap & SANE_Capability.SANE_CAP_INACTIVE) == 0; }
pure nothrow SANE_Bool SANE_OPTION_IS_SETTABLE(SANE_Int cap) { return (cap & SANE_Capability.SANE_CAP_SOFT_SELECT) != 0; }

enum SANE_Info : SANE_Int
{
    SANE_INFO_INEXACT        = (1 << 0),
    SANE_INFO_RELOAD_OPTIONS = (1 << 1),
    SANE_INFO_RELOAD_PARAMS  = (1 << 2),
}

enum SANE_Constraint_Type
{
    SANE_CONSTRAINT_NONE = 0,
    SANE_CONSTRAINT_RANGE,
    SANE_CONSTRAINT_WORD_LIST,
    SANE_CONSTRAINT_STRING_LIST
}

struct SANE_Range
{
    SANE_Word min;		/* minimum (element) value */
    SANE_Word max;		/* maximum (element) value */
    SANE_Word quant;		/* quantization value (0 if none) */
}

struct SANE_Option_Descriptor
{
    SANE_String_Const name;	/* name of this option (command-line name) */
    SANE_String_Const title;	/* title of this option (single-line) */
    SANE_String_Const desc;	/* description of this option (multi-line) */
    SANE_Value_Type type;	/* how are values interpreted? */
    SANE_Unit unit;		/* what is the (physical) unit? */
    SANE_Int size;
    SANE_Capability cap;		/* capabilities */

    SANE_Constraint_Type constraint_type;
    union constraint_t
    {
        const(SANE_String_Const)* string_list;	/* NULL-terminated list */
        const(SANE_Word)* word_list;	/* first element is list-length */
        const(SANE_Range)* range;
    }
    constraint_t constraint;
}

enum SANE_Action
{
    SANE_ACTION_GET_VALUE = 0,
    SANE_ACTION_SET_VALUE,
    SANE_ACTION_SET_AUTO
}

enum SANE_Frame
{
    SANE_FRAME_GRAY = 0, /* band covering human visual range */
    SANE_FRAME_RGB,	/* pixel-interleaved red/green/blue bands */
    SANE_FRAME_RED,	/* red band only */
    SANE_FRAME_GREEN,	/* green band only */
    SANE_FRAME_BLUE 	/* blue band only */
}


/* push remaining types down to match existing backends */
/* these are to be exposed in a later version of SANE */
/* most front-ends will require updates to understand them */
/+
#define SANE_FRAME_TEXT  0x0A  /* backend specific textual data */
#define SANE_FRAME_JPEG  0x0B  /* complete baseline JPEG file */
#define SANE_FRAME_G31D  0x0C  /* CCITT Group 3 1-D Compressed (MH) */
#define SANE_FRAME_G32D  0x0D  /* CCITT Group 3 2-D Compressed (MR) */
#define SANE_FRAME_G42D  0x0E  /* CCITT Group 4 2-D Compressed (MMR) */

#define SANE_FRAME_IR    0x0F  /* bare infrared channel */
#define SANE_FRAME_RGBI  0x10  /* red+green+blue+infrared */
#define SANE_FRAME_GRAYI 0x11  /* gray+infrared */
#define SANE_FRAME_XML   0x12  /* undefined schema */
+/

struct SANE_Parameters
{
    SANE_Frame format;
    SANE_Bool last_frame;
    SANE_Int bytes_per_line;
    SANE_Int pixels_per_line;
    SANE_Int lines;
    SANE_Int depth;
}


struct SANE_Auth_Data;

enum SANE_MAX_USERNAME_LEN = 128;
enum SANE_MAX_PASSWORD_LEN = 128;

/+
typedef void (*SANE_Auth_Callback) (SANE_String_Const resource,
                    SANE_Char *username,
                    SANE_Char *password);
+/
alias extern(C)
    void function(
        SANE_String_Const resource,
        SANE_Char* username,
        SANE_Char* password)
            SANE_Auth_Callback;

extern(C) SANE_Status sane_init (SANE_Int * version_code,
			      SANE_Auth_Callback authorize);
extern(C) void sane_exit();
extern(C) SANE_Status sane_get_devices (const(SANE_Device**)* device_list,
				     SANE_Bool local_only);
extern(C) SANE_Status sane_open (SANE_String_Const devicename,
			      SANE_Handle * handle);
extern(C) void sane_close(SANE_Handle handle);
extern(C) const(SANE_Option_Descriptor*)
  sane_get_option_descriptor (SANE_Handle handle, SANE_Int option);
extern(C) SANE_Status sane_control_option (SANE_Handle handle, SANE_Int option,
					SANE_Action action, void *value,
					SANE_Info * info);
extern(C) SANE_Status sane_get_parameters (SANE_Handle handle,
					SANE_Parameters * params);
extern(C) SANE_Status sane_start (SANE_Handle handle);
extern(C) SANE_Status sane_read (SANE_Handle handle, SANE_Byte * data,
			      SANE_Int max_length, SANE_Int * length);
extern(C) void sane_cancel (SANE_Handle handle);
extern(C) SANE_Status sane_set_io_mode (SANE_Handle handle,
				     SANE_Bool non_blocking);
extern(C) SANE_Status sane_get_select_fd (SANE_Handle handle,
				       SANE_Int * fd);
extern(C) SANE_String_Const sane_strstatus (SANE_Status status);

