Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749178;
	b=zyxkURiMWEKaW8Bdaqi6xPW3VfAlfz8ApMca7H8LGmt8bFPGc3Ey3/8+3aftyGJdxVb3
	 9G2MYje/Y354QBLm6yTgtZzJqQumZaMbQpGoJiIcehBe83DAc2E0WnSCoNxFjCGwejwdg
	 3Iluv8Va22HymsUDJsER5TwT9BxNvRZ9Fh8XgNvUBZnByiaUEJUUik+PSyeE704TxnGkl
	 newUiCd9xqHRigAKb4MLEpsZa/1/NZ0lbYFdYVuLhOWa7NikkyVdE2osWEF3tYMSbK9fq
	 Buj72R4aHJtaFqd2dodnnE4JQhwkSOMXNXLeA5Fsbg/QhdwCG1LllZOhmrTjpsVN9RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+e9lBaxj2RZ0ZeX4Opx/X6I6Bw5jb8RH55Fa71bptw0=;
	b=anxQ6/DLd9f5G/oGs4pKlDs6Kvjr+9saaVPNGZl6Jcm+xHfP2IP+0Ki7/EeE5B+JS9Ks
	 Ostkaab+Z/oErmXiaKU7RT/bD62oV8qEj0DnNNGqDIUN+0VLnCB7LFuFSGN9iI027YPtp
	 kae3jnJhcT0057UnBgYNxmme957np5rz0nwnCKdm3ekgb0+KNLd1BCub4pXKXe5JdzqKm
	 zf0JeGFNDdPSn7GEhfoX3j7O4EyvMNLS1SKl/xtQc6t1eqbRjtttJJC3mfIYGBGwopg0H
	 CzMbVXRw1xxoFn8T4+CUMjJd6ubVxg4ueDV6M+ZHyxv1LE+s1WdaZMlm+OBMwfAKBWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ns2g/Gtt";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C4B606A31A
	for <ipsec@lists.linux.dev>; Sun, 15 Nov 2026 13:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C4B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ns2g/Gtt
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so3721591c88.0
        for <ipsec@lists.linux.dev>; Sun, 15 Nov 2026 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794749177; x=1795353977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+e9lBaxj2RZ0ZeX4Opx/X6I6Bw5jb8RH55Fa71bptw0=;
        b=Ns2g/Gtt6afMS2JCI5RleryI0mcUgsptqYCC+J6TeltPa4GnGKACBPjS936g/Z5sV+
         /7uJzuucBaGWXywGSZ9LJ/AP/afF9KyRyeUyOqoD6kDQTNxHwT0z+FI0hxyVzbg3Hw/J
         qS4RoKrfg+eMK3tj5/i5KF+kQ5PUexM4gYvfV0XwZFfzHdocO/xD7vDgCnRdR0cIgSto
         8thKng2t/bHYnw5kCcTMwDSJApuDMSK3xY6lXmEtAMpN8KNrncgO/5HASg4hzF25BizT
         ARCYmF2BTJ1XqYTxXJxvSxs/UbIqA219sTVFUMkXL0cWsuWau4rZTetbX/WErYR+rDnW
         70LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794749177; x=1795353977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e9lBaxj2RZ0ZeX4Opx/X6I6Bw5jb8RH55Fa71bptw0=;
        b=OgI77k/akN0UuCRrWZv/Zg60kp0S5teCV0IBoFExfK4p/GEoUtyPXmL58bd77KjZmC
         YptjZAc8fYFaSRiAvOeKgLKXgqhlfZYxbkdfA90qMierqWKPUa34Yl7WRYchYppQLuQL
         YG7YIbRKFD5tydbH/olKycwjTsAfH5/4OKHlnFA8I+A9E6bmqcwdot/3jj4WrhwDulsG
         gL72meBMw+I/xD4WEqRiXDjBy6VY1D5X1z3Mg2Kjq5J7MS+Jf4w9KYYLFVyRBE6qW9js
         JIHX+RgMrdUuiVeKGbW5n205FLT+fTVVK6HV1UuszhrpJnXHkNsvKqKPKwDsLmwlFh3r
         DWTA==
X-Forwarded-Encrypted: i=1; AL+hErGhJOpPuh/+WIOPAzsL6iIQ1qkytq03XMTHCB3LmFDOMONg3dxLUFgVXCf4Nx35oBcEzocWxg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+BvrFXA/WIbm6QojfzNhamKH5nBvPEuiedagy3cJTrz8N9oxJ6
	tiTdMqa45JjXnUkuMpt9HOsljjwygxbNbbVyCNoN9B/9OtrW46kE2O31
X-Gm-Gg: AYBFou2LVRz8w1iecu9X/lc7i4PNOnmsri2M56EFrdDwlCd7rVLD9qAgp7eOm2fBbbW
	BjNx24Ll1qOhkxu88oZEEWLLtzrD0orEJA0AXz1hbUw76QAlxzi+vQ7N+UPiNQTJlyArfKiwW1K
	8ovSZB83CSA9erYr5VV1PD8hUwaFfrBZsAy8WO6ekT83Dp4pKsWl48WJqYot+t9HLiiLs5ZxQE7
	QjuY2CSxNOL25I++BDyBdRM1KjHhTpQ/qF2lxWOe3MpYlRn27sc8SCe2zuhxEy+wEl76R2GcWqA
	n9T9ZW4F1IcDxT+5U1+psP3Mkv4sUARK1c5UdenFiB7vIYoBogUYOF/3tUr9OOYDLKl4VTA7Mxc
	ClcEb+vChQBTDjk6lSPi8CnJNJ+KWnCVLqBqhNJhwMZ5yBSIfYWhu4BtruBPHT2aw2utL0FldoV
	ShGNyVQRcI3g7fG6940FheS+dUlifWCIK8v1QNMcsjGasBnTyFgGLniTM4SK0bzGbFKlEPA2XG+
	ysVAYsbHGYCK1FKwd6fCo2x0n2QRPksULA1KNvjc2zo9oDQd7wAkDz2ZIUiQOqr0RccKBeE+/RA
	H8j4+hjV+4Tsvw8bYvD9FTPZyJz0
X-Received: by 2002:a05:7301:5518:b0:379:d02f:dfe8 with SMTP id 5a478bee46e88-379d02fe0b9mr6467112eec.14.1794749177124;
        Sun, 15 Nov 2026 05:26:17 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac5:d45c:e6::17:34a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm24465309eec.26.2026.11.15.05.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:26:16 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: Christian Hopps <chopps@labn.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+622de7e1f18a30fc404a@syzkaller.appspotmail.com
Subject: [PATCH ipsec] xfrm: iptfs: force a dst reference before queueing an skb
Date: Sun, 15 Nov 2026 20:26:11 +0700
Message-ID: <20261115132611.427311-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iptfs_output_collect() is the dst->output hook and runs under the
caller's RCU read lock. It queues the skb and sends it later from the
iptfs hrtimer. The skb may still carry a noref dst, e.g. one set by
__ip_queue_xmit() via skb_dst_set_noref(). Once the RCU section ends,
nothing keeps that dst alive.

When the timer fires, xfrm_output_one() calls skb_dst_force() outside
any RCU section:

  WARNING: include/net/dst.h:326 at xfrm_output_resume+0x41d9/0x64e0
  Call Trace:
   xfrm_output_one net/xfrm/xfrm_output.c:549 [inline]
   xfrm_output_resume+0x41d9/0x64e0 net/xfrm/xfrm_output.c:597
   iptfs_output_queued net/xfrm/xfrm_iptfs.c:2325 [inline]
   iptfs_delay_timer+0x3803/0x4310 net/xfrm/xfrm_iptfs.c:2362
   __run_hrtimer kernel/time/hrtimer.c [inline]
   __hrtimer_run_queues+0x3bc/0xa10 kernel/time/hrtimer.c
   hrtimer_run_softirq+0x1e3/0x2e0 kernel/time/hrtimer.c:2153
   handle_softirqs+0x265/0x8d0 kernel/softirq.c:669

The warning also means the queued skb may point to a dst that has
already been freed.

Take a reference with skb_dst_force() while still under RCU, as other
deferred xmit paths do, and drop the skb if its dst is already gone.

Fixes: 0e4fbf013fa5 ("xfrm: iptfs: add user packet (tunnel ingress) handling")
Reported-by: syzbot+622de7e1f18a30fc404a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=622de7e1f18a30fc404a
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU with the syzbot C reproducer on origin/master (23c62304dde2),
60s per run: unpatched kernel hits 48 of these warnings; patched kernel
hits 0 in 3 runs, with no KASAN reports.

 net/xfrm/xfrm_iptfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa8a9..3fff835497b9 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -1914,6 +1914,13 @@ static int iptfs_output_collect(struct net *net, struct sock *sk, struct sk_buff
 			continue;
 		}
 
+		/* The queued skb outlives our RCU section, so pin its dst. */
+		if (!skb_dst_force(skb)) {
+			XFRM_INC_STATS(net, LINUX_MIB_XFRMOUTERROR);
+			kfree_skb(skb);
+			continue;
+		}
+
 		/* Enqueue to send in tunnel */
 		ok = iptfs_enqueue(xtfs, skb);
 		if (!ok)
-- 
2.43.0

