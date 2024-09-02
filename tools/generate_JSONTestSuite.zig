// zig run this file inside the test_parsing/ directory of this repo: https://github.com/nst/JSONTestSuite

const std = @import("std");

pub fn main() !void {
    var gpa: std.heap.GeneralPurposeAllocator(.{}) = .init;
    var allocator = gpa.allocator();

    var output = std.io.getStdOut().writer();
    try output.writeAll(
        \\// This file was generated by _generate_JSONTestSuite.zig
        \\// These test cases are sourced from: https://github.com/nst/JSONTestSuite
        \\const ok = @import("./test.zig").ok;
        \\const err = @import("./test.zig").err;
        \\const any = @import("./test.zig").any;
        \\
        \\
    );

    var names = std.ArrayList([]const u8).init(allocator);
    var cwd = try std.fs.cwd().openDir(".", .{ .iterate = true });
    var it = cwd.iterate();
    while (try it.next()) |entry| {
        try names.append(try allocator.dupe(u8, entry.name));
    }
    std.mem.sort([]const u8, names.items, {}, (struct {
        fn lessThan(_: void, a: []const u8, b: []const u8) bool {
            return std.mem.lessThan(u8, a, b);
        }
    }).lessThan);

    for (names.items) |name| {
        const contents = try std.fs.cwd().readFileAlloc(allocator, name, 250001);
        try output.writeAll("test ");
        try writeString(output, name);
        try output.writeAll(" {\n    try ");
        switch (name[0]) {
            'y' => try output.writeAll("ok"),
            'n' => try output.writeAll("err"),
            'i' => try output.writeAll("any"),
            else => unreachable,
        }
        try output.writeByte('(');
        try writeString(output, contents);
        try output.writeAll(");\n}\n");
    }
}

const i_structure_500_nested_arrays = "[" ** 500 ++ "]" ** 500;
const n_structure_100000_opening_arrays = "[" ** 100000;
const n_structure_open_array_object = "[{\"\":" ** 50000 ++ "\n";

fn writeString(writer: anytype, s: []const u8) !void {
    if (s.len > 200) {
        // There are a few of these we can compress with Zig expressions.
        if (std.mem.eql(u8, s, i_structure_500_nested_arrays)) {
            return writer.writeAll("\"[\" ** 500 ++ \"]\" ** 500");
        } else if (std.mem.eql(u8, s, n_structure_100000_opening_arrays)) {
            return writer.writeAll("\"[\" ** 100000");
        } else if (std.mem.eql(u8, s, n_structure_open_array_object)) {
            return writer.writeAll("\"[{\\\"\\\":\" ** 50000 ++ \"\\n\"");
        }
        unreachable;
    }
    try writer.writeByte('"');
    for (s) |b| {
        switch (b) {
            0...('\n' - 1),
            ('\n' + 1)...0x1f,
            0x7f...0xff,
            => try writer.print("\\x{x:0>2}", .{b}),
            '\n' => try writer.writeAll("\\n"),
            '"' => try writer.writeAll("\\\""),
            '\\' => try writer.writeAll("\\\\"),
            else => try writer.writeByte(b),
        }
    }
    try writer.writeByte('"');
}
