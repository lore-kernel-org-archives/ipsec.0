Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818730;
	b=EezAXH8I5M08SOrzO2mJomuX3264Z8SflDQCBHWs5Kuj6VaLSKnI8tGHVZDykt41cnHR
	 G2vg8SW1zYKT0fyo7IyvE2NiJPaGRWORPyaedL3wTw6zHzI30u4X4Tnb6HSWB34RcVOP8
	 oaxIQY0RlmD1iqYY7Pba+gqZr66UOJqNNFeGZinRp1v7ogN0wd2x7PDax52sZ/wWeWZEx
	 lm0rytacVkvxZ7q0HGZKNHxEdYcacpdVp1evtSLbColugBj7FKVZ0Ti28CMO8mrLP2yov
	 o2Sx9Zt8AnbRTFhPbPvcFEIp0MXK59ItN6YPTznPn6ky+M4h5VRsNzeJgavLqelolxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JkfqMAYa303IAXL1Qwk53rqN6BbVqNVDCZjhNvYLNXg=;
	b=hEUlo/DI5Mv/qjoT2ZbnjE2xmdK3IZRKAmEKqfLmI1ohyFuHojSYO3gwZl3eam8h7LC9
	 ma6Ew8BBddgufwrnzMS7Rv5s5vIb8YEJvbqvCiOk1YiYit325r5FLuC73kFmakcmTJp1b
	 i2C7lHgnCTAsq3a9s6ohXQlhCQgmUbO5kinHXBA4ZCZBHBxXdCkAjo943f/mKDG3kKcRz
	 xjRxjKW8TRT/hhSaoWAy76mXxQNlJMKL64hrw8cTHjhz6OtKK5atEeX1UJp8vQ3zDZuJG
	 i3in68a+97RTFJ5/OXTJI73xmdjvHS0Od3hATSt/j4HPMAi6CHorP1amg26Jpfr6EjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=pBVCTkpH;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA7D606A324
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 22:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA7D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=pBVCTkpH
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso4363370a12.3
        for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 14:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795818729; x=1796423529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JkfqMAYa303IAXL1Qwk53rqN6BbVqNVDCZjhNvYLNXg=;
        b=pBVCTkpHmanhIfHl/jYbsY+Sa2I8hjbpXCoHk1uF6wjdNGNU17CF+1UeuMGOzTkauV
         2dYiDHEchlrMUT7KTI5Q+QT7lRAyFayIPjna31rvUvS++g6svfw/lGGRExysO+/6mOOy
         u0keI7ypVyRisxK0oa1vKUpOcirE2C0DtPsiz9/QW4nbmepSwNCwGZqTTjeO42NS8Zu5
         t/uKebDDPPn+R88cMm4i0F0tgzbyBIBMkJr0eYr3VK249EBb1A55q8ZWlTFPUbIo+o5V
         jye86UFIweIDDvKJ1PsPeGN3rDMHYbOYXL5L/7oksj6xnyuoKlFvK9fMMBhIRjwgEJex
         iapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818729; x=1796423529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JkfqMAYa303IAXL1Qwk53rqN6BbVqNVDCZjhNvYLNXg=;
        b=0/tp/wF7YKPSUCN5ThnmPPZrss8OejnUC3+vv1ecQzY6QB1NLkmN3TuyEX3q3FyWsP
         nI8+9aBRMM/W6kUbDEV0xuPUU2c/UTilUkj1GNGO3+V9xforYlPsKxX2XpsiW/FlKbvm
         z6c5nqfBYZmi8fPBf3a07Hmc+8ZUL8aixkdXae+mzwF1fHXEcbYfte/5aYtKDDOk2QsN
         kewYVzfRGDAFQrTNMcU38KTwyy0p7x55VFwSOAvxXTa6ETieVmJYUdfRvm+BVpA6S5e0
         2kc50xpdOLfhthv70uyOb4OECkYy9s+P5pEEyStlGKZsqeJdD2aQGRjwZ8HWOtlnJYjd
         qjcw==
X-Forwarded-Encrypted: i=1; AL+hErEEyG/aTXn9VXu4kK5EGk4nybtcD6Dvn0i9Qr80Z9wBWs25tDspeXnCiKM1rgXXtPV3ZsfN6w==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Kyanyke7JCwoMAVlwNwYZ735ErkHzftub8B2E74XsIiHDw2NI
	4leCGzb9slwUWANwHEpn0fIuPyeIiAt/8S4SbwEEC07lMrllGwAMz8r0iwgEOPTXUjtt4nqO6HK
	blbSyaBGGSjNJ3kjxZadIghzpxug8J/e6hritcP40MO1EIajGg2Kh
X-Gm-Gg: AZFdTZeU8ZV3r60Z+SvyMBUbPcjstznxhneImrLjdRjvqvH7HWNBEPgQUGSp1LAvpbE
	dzSTn7IuMw7Ee16vQD0Wiqqk/wLj4nttyiP84Fs7aA/HLN6pVcB5faXOqDa6A1PUoSYftgAKXkC
	8sFn+DvQb04D0pD19e9LvIvaYo8G7XrYynwmLt1YoVqh8hck7HmlZ62gMKqw+JSWKQkHvca4lel
	+tsiRF3QhW13CfCq4gWTYhc7OGtCNw613cwROYPmcrC+cXbkuXdPI3oSIqERUcZPmJHEiV1nFAG
	Qee7cL7PMAXkS2flTeNEzoHSJuQ8nz2m+4bcliHiKJ3T0qLkRziuYAdLbpnMG9xr9az9SZpv/Mu
	gnWpMUWckHwdEcIW4TIkcuYn0O4U=
X-Received: by 2002:a17:90b:2cce:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b41c95f64dmr26944682a91.54.1795818728866;
        Fri, 27 Nov 2026 14:32:08 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4d00c6137sm8742684a91.5.2026.11.27.14.32.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 14:32:08 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec] xfrm: iptfs: give a runt-started inner packet a MAC header
Date: Fri, 27 Nov 2026 14:32:05 -0800
Message-ID: <e7d0ab12-61be-4ba7-9a2d-4a71ca73dc4e@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
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

When an inner packet's IP header is split across two outer packets (a
runt, which RFC 9347 allows), iptfs_reassem_cont() allocates the skb
for the rest but never sets its MAC header. Any packet socket on the
device then pushes back toward the unset header and panics:

  skbuff: skb_under_panic: text:ffffffff82071ea5 len:-65455 put:-65455
   skb_push+0x53/0x60
   tpacket_rcv+0x91f/0xee0
   netif_receive_skb_list_internal+0x49b/0x10e0

An unprivileged user can set the whole thing up (both tunnel ends and
the capture in its own namespaces). With GRO on the ingress device,
gro_list_prepare() reads past the head the same way, with no socket
at all. Rebuild the MAC header from the outer packet.

The patch was written with an AI coding assistant and reviewed by the
submitter.

Fixes: 075694765446 ("xfrm: iptfs: handle received fragmented inner packets")
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
Found by an AI code review agent while testing an unlocked runt state.
Validated with a shell + Python (cryptography) + C netlink reproducer,
no kernel changes or fault injection; a sender without the SA's keys
cannot reach it (ESP drops forged runts). Tested: the reproducer
panics unmodified kernels, as root and as an unprivileged uid, and
passes with the fix, with well-formed frames; KASAN and lockdep
builds, panic_on_warn=1 on the fixed kernel. GRO evidence (no packet
socket needed), on f0e68014f4ac: IPv6 ESP-in-UDP with runts through
GRO + rx-gro-list at ingress triggers KASAN slab reports in
dev_gro_receive() (read of size 8); the same traffic with runts=0 is
clean, and the fixed stack forwards everything with no report. Also
reproduced with the sender on one host and a KASAN victim on another,
needing only CONFIG_XFRM_IPTFS (the xfrm_iptfs module, or built in);
present since v6.14. A reproducer is available to the maintainers on
request. Depends-on
note: this copy relies on C1
([PATCH ipsec] xfrm: iptfs: reserve room for the outer MAC header in
new inner skbs, patchwork 15029420, posted 11-27) for long MAC headers.

 net/xfrm/xfrm_iptfs.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 3fff835497b9..28b9fa109251 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -845,6 +845,20 @@ static u32 iptfs_reassem_cont(struct xfrm_iptfs_data *xtfs, u64 seq,
 		}
 		xtfs->ra_newskb = newskb;
 
+		/* Rebuild the mac header from the outer packet, as
+		 * __input_process_payload() does for the skbs it allocates;
+		 * packet taps push back to it on receive.
+		 */
+		if (skb_mac_header_was_set(skb)) {
+			skb_set_mac_header(newskb, -skb->mac_len);
+			memcpy(skb_mac_header(newskb), skb_mac_header(skb),
+			       skb->mac_len);
+			if (skb->mac_len)
+				eth_hdr(newskb)->h_proto =
+					(xtfs->ra_runt[0] >> 4) == 6 ?
+					htons(ETH_P_IPV6) : htons(ETH_P_IP);
+		}
+
 		/* Copy the runt data into the buffer, but leave data
 		 * pointers the same as normal non-runt case. The extra `rrem`
 		 * recopied bytes are basically cacheline free. Allows using

base-commit: 1213df0bc5993e479706c5eba5830243d778f164
--
2.53.0
