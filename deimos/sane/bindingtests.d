module deimos.sane.bindingtests;

import deimos.sane.sane;

extern(C) extern __gshared uint* sane_bind_test_vals;
extern(C) extern __gshared uint** sane_bind_test_offsets;

enum SANE_BIND_TEST_BYTE_SIZEOF   = 0;
enum SANE_BIND_TEST_WORD_SIZEOF   = 1;
enum SANE_BIND_TEST_CHAR_SIZEOF   = 2;
enum SANE_BIND_TEST_ENUM_SIZEOF   = 3;
enum SANE_BIND_TEST_DEVICE_SIZEOF = 4;
enum SANE_BIND_TEST_RANGE_SIZEOF  = 5;
enum SANE_BIND_TEST_OPTION_SIZEOF = 6;
enum SANE_BIND_TEST_PARAMS_SIZEOF = 7;
enum SANE_BIND_TEST_VALS_LENGTH       = 8;

enum SANE_BIND_TEST_DEVICE_OFFSETS = 0;
enum SANE_BIND_TEST_RANGE_OFFSETS  = 1;
enum SANE_BIND_TEST_OPTION_OFFSETS = 2;
enum SANE_BIND_TEST_PARAMS_OFFSETS = 3;
enum SANE_BIND_TEST_OFFSETS_LENGTH     = 4;

extern(C) void sane_fill_bind_test_info();
extern(C) void sane_free_bind_test_info();

/* This exists to get around unions.
Union members always have a .offsetof of 0, but we want the non-zero offset
to the enclosing struct. */
private ptrdiff_t offset(T,U)(ref T agg, ref U member)
{
    return cast(ubyte*)&member - cast(ubyte*)&agg;
}

void sane_test_binary_compat()
{
    sane_fill_bind_test_info();
    scope(exit) sane_free_bind_test_info();

    assert(sane_bind_test_vals[SANE_BIND_TEST_BYTE_SIZEOF] == SANE_Byte.sizeof);
    assert(sane_bind_test_vals[SANE_BIND_TEST_WORD_SIZEOF] == SANE_Word.sizeof);
    assert(sane_bind_test_vals[SANE_BIND_TEST_CHAR_SIZEOF] == SANE_Char.sizeof);
    assert(sane_bind_test_vals[SANE_BIND_TEST_ENUM_SIZEOF] == SANE_Status.sizeof);
    assert(sane_bind_test_vals[SANE_BIND_TEST_DEVICE_SIZEOF] == SANE_Device.sizeof);
    assert(sane_bind_test_vals[SANE_BIND_TEST_RANGE_SIZEOF] == SANE_Range.sizeof);
    assert(sane_bind_test_vals[SANE_BIND_TEST_OPTION_SIZEOF] == SANE_Option_Descriptor.sizeof);
    assert(sane_bind_test_vals[SANE_BIND_TEST_PARAMS_SIZEOF] == SANE_Parameters.sizeof);

    assert(sane_bind_test_offsets[SANE_BIND_TEST_DEVICE_OFFSETS][0] == SANE_Device.name.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_DEVICE_OFFSETS][1] == SANE_Device.vendor.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_DEVICE_OFFSETS][2] == SANE_Device.model.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_DEVICE_OFFSETS][3] == SANE_Device.type.offsetof);

    assert(sane_bind_test_offsets[SANE_BIND_TEST_RANGE_OFFSETS][0] == SANE_Range.min.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_RANGE_OFFSETS][1] == SANE_Range.max.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_RANGE_OFFSETS][2] == SANE_Range.quant.offsetof);

    SANE_Option_Descriptor option;
    assert(sane_bind_test_offsets[SANE_BIND_TEST_OPTION_OFFSETS][0]  == SANE_Option_Descriptor.name.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_OPTION_OFFSETS][1]  == SANE_Option_Descriptor.title.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_OPTION_OFFSETS][2]  == SANE_Option_Descriptor.desc.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_OPTION_OFFSETS][3]  == SANE_Option_Descriptor.type.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_OPTION_OFFSETS][4]  == SANE_Option_Descriptor.unit.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_OPTION_OFFSETS][5]  == SANE_Option_Descriptor.size.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_OPTION_OFFSETS][6]  == SANE_Option_Descriptor.cap.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_OPTION_OFFSETS][7]  == SANE_Option_Descriptor.constraint_type.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_OPTION_OFFSETS][8]  == SANE_Option_Descriptor.constraint.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_OPTION_OFFSETS][9]  == offset(option, option.constraint.string_list));
    assert(sane_bind_test_offsets[SANE_BIND_TEST_OPTION_OFFSETS][10] == offset(option, option.constraint.word_list));
    assert(sane_bind_test_offsets[SANE_BIND_TEST_OPTION_OFFSETS][11] == offset(option, option.constraint.range));

    assert(sane_bind_test_offsets[SANE_BIND_TEST_PARAMS_OFFSETS][0] == SANE_Parameters.format.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_PARAMS_OFFSETS][1] == SANE_Parameters.last_frame.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_PARAMS_OFFSETS][2] == SANE_Parameters.bytes_per_line.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_PARAMS_OFFSETS][3] == SANE_Parameters.pixels_per_line.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_PARAMS_OFFSETS][4] == SANE_Parameters.lines.offsetof);
    assert(sane_bind_test_offsets[SANE_BIND_TEST_PARAMS_OFFSETS][5] == SANE_Parameters.depth.offsetof);
}

unittest
{
    sane_test_binary_compat();
}
