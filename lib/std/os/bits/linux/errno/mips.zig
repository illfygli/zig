// SPDX-License-Identifier: MIT
// Copyright (c) 2015-2021 Zig Contributors
// This file is part of [zig](https://ziglang.org/), which is MIT licensed.
// The MIT license requires this copyright notice to be included in all copies
// and substantial portions of the software.

//! These are MIPS ABI compatible.
pub const E = enum(i32) {
    /// No error occurred.
    SUCCESS = 0,

    PERM = 1,
    NOENT = 2,
    SRCH = 3,
    INTR = 4,
    IO = 5,
    NXIO = 6,
    @"2BIG" = 7,
    NOEXEC = 8,
    BADF = 9,
    CHILD = 10,
    /// Also used for WOULDBLOCK.
    AGAIN = 11,
    NOMEM = 12,
    ACCES = 13,
    FAULT = 14,
    NOTBLK = 15,
    BUSY = 16,
    EXIST = 17,
    XDEV = 18,
    NODEV = 19,
    NOTDIR = 20,
    ISDIR = 21,
    INVAL = 22,
    NFILE = 23,
    MFILE = 24,
    NOTTY = 25,
    TXTBSY = 26,
    FBIG = 27,
    NOSPC = 28,
    SPIPE = 29,
    ROFS = 30,
    MLINK = 31,
    PIPE = 32,
    DOM = 33,
    RANGE = 34,

    NOMSG = 35,
    IDRM = 36,
    CHRNG = 37,
    L2NSYNC = 38,
    L3HLT = 39,
    L3RST = 40,
    LNRNG = 41,
    UNATCH = 42,
    NOCSI = 43,
    L2HLT = 44,
    DEADLK = 45,
    NOLCK = 46,
    BADE = 50,
    BADR = 51,
    XFULL = 52,
    NOANO = 53,
    BADRQC = 54,
    BADSLT = 55,
    DEADLOCK = 56,
    BFONT = 59,
    NOSTR = 60,
    NODATA = 61,
    TIME = 62,
    NOSR = 63,
    NONET = 64,
    NOPKG = 65,
    REMOTE = 66,
    NOLINK = 67,
    ADV = 68,
    SRMNT = 69,
    COMM = 70,
    PROTO = 71,
    DOTDOT = 73,
    MULTIHOP = 74,
    BADMSG = 77,
    NAMETOOLONG = 78,
    OVERFLOW = 79,
    NOTUNIQ = 80,
    BADFD = 81,
    REMCHG = 82,
    LIBACC = 83,
    LIBBAD = 84,
    LIBSCN = 85,
    LIBMAX = 86,
    LIBEXEC = 87,
    ILSEQ = 88,
    NOSYS = 89,
    LOOP = 90,
    RESTART = 91,
    STRPIPE = 92,
    NOTEMPTY = 93,
    USERS = 94,
    NOTSOCK = 95,
    DESTADDRREQ = 96,
    MSGSIZE = 97,
    PROTOTYPE = 98,
    NOPROTOOPT = 99,
    PROTONOSUPPORT = 120,
    SOCKTNOSUPPORT = 121,
    OPNOTSUPP = 122,
    PFNOSUPPORT = 123,
    AFNOSUPPORT = 124,
    ADDRINUSE = 125,
    ADDRNOTAVAIL = 126,
    NETDOWN = 127,
    NETUNREACH = 128,
    NETRESET = 129,
    CONNABORTED = 130,
    CONNRESET = 131,
    NOBUFS = 132,
    ISCONN = 133,
    NOTCONN = 134,
    UCLEAN = 135,
    NOTNAM = 137,
    NAVAIL = 138,
    ISNAM = 139,
    REMOTEIO = 140,
    SHUTDOWN = 143,
    TOOMANYREFS = 144,
    TIMEDOUT = 145,
    CONNREFUSED = 146,
    HOSTDOWN = 147,
    HOSTUNREACH = 148,
    ALREADY = 149,
    INPROGRESS = 150,
    STALE = 151,
    CANCELED = 158,
    NOMEDIUM = 159,
    MEDIUMTYPE = 160,
    NOKEY = 161,
    KEYEXPIRED = 162,
    KEYREVOKED = 163,
    KEYREJECTED = 164,
    OWNERDEAD = 165,
    NOTRECOVERABLE = 166,
    RFKILL = 167,
    HWPOISON = 168,
    DQUOT = 1133,
    _,
};
