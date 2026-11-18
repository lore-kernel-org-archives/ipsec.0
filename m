Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018498;
	b=4945NkKF9PgU0fftnlfopHoLmdDLmq7viz2IsBl8Rie+Dea0TcT0V/ccJAumvsRFvdQR
	 /R5hqSgJILZ9TauL0khsH1B6lS+TuMhpq0UdCleyNlRcPavq4j0FwNlhTTkcBN0IioKnZ
	 cbsp7N+8ewtvVGurGz9G8nFy84vxt111vRJW3pqwgiilRuw18QGWnx9PtUd6GVWKq4jfS
	 2Wkulq+pbjeAi94ymx1Hy4t5LmD/uGdk2wasJF3dIIvWOBQc98ku+Y3LNz0Arv7EBKrwW
	 OSuc2rgRwkV63MmWERB44xIrYjR87McgebR/TDbEvq/9o9b4hnTqjMc21o6xvbiKGjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018498;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=aO88IJ7z5BBCK3aO82ObI6LwPt3VLY3xqkcUcJTRk4E=;
	b=mJARVH+B22DY5otiBmh1KPPQYkD6NSE5atz8CKUYkH41XO5auzIGzZvLq+aYUdaSEPHv
	 M3wNxXqYseQpf8Cfzdrl9L0lUnwfs7HmyON/xPF/J0M6Fs5HLUjZ3Kck0dTd7VBaye2hY
	 IN1zObsV0fHR6QA/CCldSdaLK6xPFY12BDLDDklSGHvMBML8/mnbZ9Zrk1zJ5wkkQEMAV
	 8/7V7TtZ69RJn0KSn3x4s6GRNSXIxrHDUC/JKqIyHdLTYv4qldm2PxUa8IQVQel/JntlF
	 BsoUVoZUuEGFzM9jcY8AJ53dBT0Yyfj6UREGwLnK2WJlcoKZ45SCbpi9lnCvj+6ZoLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEBD606A32A
	for <ipsec@lists.linux.dev>; Wed, 18 Nov 2026 16:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DEBD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c55ba309c2so1060596b6e.1
        for <ipsec@lists.linux.dev>; Wed, 18 Nov 2026 08:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018497; x=1795623297;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aO88IJ7z5BBCK3aO82ObI6LwPt3VLY3xqkcUcJTRk4E=;
        b=rTbGnDBSNqKfN7Km5ipreDWybMZRRGJZBWX8bgFzihhDieATRsytX99QShhZj/vKsU
         Re+FKbO7dB0XFA3viKnPAICqztPM+GWRSIcIoHY1t3uK9SnEr/kPVBLHS3J2yR2couLX
         VE7fhDFRppnaBkga9wFb3y3tri3jfg9T1lP8D0uYEm1iKV48aj8t8vQZuDkFLJOJWyKT
         dgXYdY+yc0wxhe8XPvhmD8tuM8ljWg4utj+k57NpaPjSiFOigrtvD3xzyZmNtuFxtAdD
         ijHNokQsLEYO+qfV72luhUm/LCbdf38IEb7/RzL8WWVn2g1BbRJD0KHtgTbd/10MlXzC
         /c8g==
X-Forwarded-Encrypted: i=1; AL+hErGVx4XRKrfq9jg4+koxO3yr9IJXKQMpCGgSibOHVc9vbURv6nZLafoxMw3NLSzYb527zETrKg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+iHxnKGUsKgXUmlV9ZkEzV2ZlKyMFLfp8sWsBPQJx7U+FjQUv/
	6WsvUUZSAwM14Yv7fV+eSiFhibBVBmY1K8aQrnyHLOBzFuBOQM0BxrAweDG+KJca+Oit9odTXqS
	3RgDIytQYbNlXlOHtU11B7/tgw1GfxN1f1+0bjGH4ox5r2/cKMOXRFphyzNA=
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:198d:b0:4d6:9283:1df2 with SMTP id
 5614622812f47-5773e055ebfmr4168074b6e.61.1795018497186; Wed, 18 Nov 2026
 08:14:57 -0800 (PST)
Date: Wed, 18 Nov 2026 08:14:57 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afdcf01.ca6cd63e.174a34.0001.GAE@google.com>
Subject: [syzbot] [net?] WARNING in xfrmi_xmit
From: syzbot <syzbot+d29af9ef5c96a3f5e96c@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@kernel.org, herbert@gondor.apana.org.au, 
	horms@kernel.org, ipsec@lists.linux.dev, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	steffen.klassert@secunet.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    666539eecdf4 Merge tag 'assoc-array-fixes-v2'
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=170dce4d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3cc6a7ee2d24d208
dashboard link: https://syzkaller.appspot.com/bug?extid=d29af9ef5c96a3f5e96c
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=105b5755580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10136803580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-666539ee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/57b04345f38e/vmlinux-666539ee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/127bf2b14452/bzImage-666539ee.xz

AI-generated root cause summary:
In AF_XDP generic transmit, xsk_build_skb() and xsk_build_skb_zerocopy()
allocate an sk_buff and advance skb->data using skb_reserve(skb, hr) without
subsequently resetting the network header via skb_reset_network_header().
Because skb->network_header remains 0 (relative to skb->head),
skb_network_offset(skb) returns a negative value equal to -hr (e.g. -64). When
transmitting over devices whose ndo_start_xmit checks pskb_inet_may_pull() (such
as xfrm interfaces), this negative offset is converted to a large unsigned
integer when added to the network header length (0xffffffc0 > INT_MAX),
triggering a DEBUG_NET_WARN_ON_ONCE assertion in pskb_may_pull_reason().

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=d29af9ef5c96a3f5e96c

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d29af9ef5c96a3f5e96c@syzkaller.appspotmail.com

------------[ cut here ]------------
len > ((int)(~0U >> 1))
WARNING: ./include/linux/skbuff.h:2856 at pskb_may_pull_reason include/linux/skbuff.h:2856 [inline], CPU#0: syz.0.17/5560
WARNING: ./include/linux/skbuff.h:2856 at pskb_network_may_pull_reason include/linux/skbuff.h:3286 [inline], CPU#0: syz.0.17/5560
WARNING: ./include/linux/skbuff.h:2856 at pskb_inet_may_pull_reason include/net/ip_tunnels.h:483 [inline], CPU#0: syz.0.17/5560
WARNING: ./include/linux/skbuff.h:2856 at pskb_inet_may_pull include/net/ip_tunnels.h:488 [inline], CPU#0: syz.0.17/5560
WARNING: ./include/linux/skbuff.h:2856 at xfrmi_xmit+0x1844/0x1eb0 net/xfrm/xfrm_interface_core.c:534, CPU#0: syz.0.17/5560
Modules linked in:
CPU: 0 UID: 0 PID: 5560 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:pskb_may_pull_reason include/linux/skbuff.h:2856 [inline]
RIP: 0010:pskb_network_may_pull_reason include/linux/skbuff.h:3286 [inline]
RIP: 0010:pskb_inet_may_pull_reason include/net/ip_tunnels.h:483 [inline]
RIP: 0010:pskb_inet_may_pull include/net/ip_tunnels.h:488 [inline]
RIP: 0010:xfrmi_xmit+0x1844/0x1eb0 net/xfrm/xfrm_interface_core.c:534
Code: db e9 ef fd ff ff e8 bb 47 23 f7 49 8d b4 24 20 01 00 00 48 c7 c7 80 9b 54 8d e8 77 d2 81 f6 e9 c8 f8 ff ff e8 9d 47 23 f7 90 <0f> 0b 90 e9 38 ea ff ff 89 df 44 89 ee e8 9a 49 23 f7 44 39 eb 0f
RSP: 0018:ffffc90001be7300 EFLAGS: 00010293
RAX: ffffffff8aa5f033 RBX: 00000000ffffffc0 RCX: ffff88803050a580
RDX: 0000000000000000 RSI: 00000000ffffffc0 RDI: 0000000000000000
RBP: ffffc90001be7490 R08: ffffc90001be7417 R09: 0000000000000000
R10: ffffc90001be73c0 R11: fffff5200037ce83 R12: 0000000000000000
R13: 1ffff9200037ce74 R14: ffff8880136f5358 R15: ffff8880136f5280
FS:  00005555787d1500(0000) GS:ffff88808a9f1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000001f9fc000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __netdev_start_xmit include/linux/netdevice.h:5457 [inline]
 netdev_start_xmit include/linux/netdevice.h:5466 [inline]
 __dev_direct_xmit+0x4b6/0x730 net/core/dev.c:5164
 __xsk_generic_xmit net/xdp/xsk.c:1288 [inline]
 xsk_generic_xmit+0x27d8/0x47a0 net/xdp/xsk.c:1344
 xsk_poll+0x326/0x670 net/xdp/xsk.c:1472
 sock_poll+0x341/0x460 net/socket.c:1517
 vfs_poll include/linux/poll.h:82 [inline]
 do_pollfd fs/select.c:877 [inline]
 do_poll fs/select.c:920 [inline]
 do_sys_poll+0x98f/0x1150 fs/select.c:1015
 __do_sys_ppoll fs/select.c:1112 [inline]
 __se_sys_ppoll+0x209/0x2b0 fs/select.c:1092
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa010ba94d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff5b713048 EFLAGS: 00000246 ORIG_RAX: 000000000000010f
RAX: ffffffffffffffda RBX: 00007fa010e25fa0 RCX: 00007fa010ba94d9
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000200000000800
RBP: 00007fa010c38136 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fa010e25fac R14: 00007fa010e25fa0 R15: 00007fa010e25fa0
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
