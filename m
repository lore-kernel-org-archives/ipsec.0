Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896462;
	b=GjDAzygMxtBrHBEac+Ekoc+AeN+sbL9439M52+nZXtW7PK00JZl2gssV22Y5G/OFm5Gc
	 eSvYHcHm8oAB4O6EnOzG3JAM7xJMqp5ueFEqJjae+1CDO/8LzAl4HXn+mFQ4nRE5vp9al
	 MU6N5fZiRdB3InadPo3VjWcmIuW5fvQxU+05FbH7Vf1ofooald8gD9+a1BBGASBBO5RG3
	 yxjNfFGMi3KMINh66Xz4BAB6i8o1hVhp+PWHdfiqtQ2DH9zt7uLmxJ1aM8ZqIVW8odSSq
	 L6umibIzwD/Cb+8IMknlc2eSrztR6Rzb+sKxkh1Gg7TqsjFOnktdgmKr6how0jRKtog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NMCfTKaQFPqIG16pX0W13wdOlIRyQ9c9PPUggitB6aQ=;
	b=JX2tDQTMT+sAuco8/GX7gfJS0zVP0u15cgRoRW1kWJOPQZkdW5iagHpBDRu3s0Zs0Mif
	 rche6bajCLmTp8acqLitD+jAnySX0ti/pP0rWldLvSnKYO01s/Jm0UusgFqoIW57MI6O1
	 PyZPtyiJe25xk+83RQTCdrYFF1cVelIi3dWAwxQPWX+Wxs9Hry+zJOsAy1Jdzi/7pIHi8
	 eSYjf9zB1B6O2u48dmFNhwZU6uX+O95xm5PWva6NS3E024mA4HHnB5AO5WqF+24Q5LTq+
	 PWlxlvUkfmSmBXtHB51qvRH4O9Ug5HBmEZ7dkk6MyIngKxpe2ipb0MUDOhFDuOTgzVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=EnFzkCt3;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE049606A31C
	for <ipsec@lists.linux.dev>; Tue, 17 Nov 2026 06:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE049606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=EnFzkCt3
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed2bfe3252so15620815ad.3
        for <ipsec@lists.linux.dev>; Mon, 16 Nov 2026 22:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794896460; x=1795501260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMCfTKaQFPqIG16pX0W13wdOlIRyQ9c9PPUggitB6aQ=;
        b=EnFzkCt3xHO7yzfckKg1tchTV/35Ekv3I89fXoueYHoIxjzHnK2J2SqBU6sAEEkI4d
         k3yvepePziCaWcHiCP4doyHd+ls5ugywnhB246CMu3UUQiC3pwvJbFz1mojy7srKT+zC
         iGHUNi6NouDrV4UR7MeauxS/O2am+HVULEslk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896460; x=1795501260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMCfTKaQFPqIG16pX0W13wdOlIRyQ9c9PPUggitB6aQ=;
        b=c8C9lhBLJ6ZpnX5HTP7QefuC8jw72LOumDjIr3YlQ2tVdPBnMhnEVBoQMe0FSko+ZG
         xf4iYgs8Yn3DqTF+BfGT2jzcm/awoYVmhOixlwD+Km0qpNJS9S9urBXqVLF7dRvNeNOh
         YXwhdP5acmeWp4tZ6HvdUWIjFfktyBWckfesLMoLan8QWJgwQ8Jis+quQhcX/C+RDncl
         TuOF5HAIE8gkkbFj24bf/u/fwx7+1gfbBnlrIXU6owlcIXEDlPTXV9BJ0LAk2fyqq/fO
         0PyenXb9LQyMnLmeluDKzXR+c7pef+QBD+VBpYgC1ofxg91Vf5DSGf97Hu7lgMvIhgLC
         bQjQ==
X-Forwarded-Encrypted: i=1; AL+hErHHmxS8CY4wOnkbZNk7B7OFY4hNNnlJyFr3bOKDduDvJbxTwLyGPgS05B6xw/oHW4GrtVumJw==@lists.linux.dev
X-Gm-Message-State: APuU4Z874ynNI22xZZwtYjx0re6L7v8qN9RgUg9fX3fdQtQiaHtQs83f
	fw+Chcm63UQLfeLfTcxIgSUwLCH2t+bBCdlNHMvOlwN9ilRFYueiot+lFMxmjxJlgzU=
X-Gm-Gg: AZFdTZfRXoDs2bzNPagBB8qOVf6r+kOH7Y2UXHS7YA2sujJftluJ2M4pdxSmES/L5Wb
	mI8m7qUdC9jsPpvTIguBUxCYR99VwAHc8il39iNF8xSEZ5tAfWLSAWYrLDIwg0hwa/EI7hM33oz
	pvTpcjT1hkxnu7Me5x0yuVbqseN1U6fxDkNn5xwePW2bh9H3Zn0oUiD4qsZcvsHI67tRDsKvZjP
	VTTUvR2XwxoQ6/0IEFq5D4vTD9duLpI6AxdpcyMqTBz+4DhfC0VM2upQVbWelB2vkAh677Gr2iH
	sM2uVyLd93XD1exTQ53jjMJL2oTD02+BA82OsVO60kSOzNOh+S11C7cxOCc5gnrBzeJlXMUAhFF
	XEcaJ9A8z4iceDvcUecbw+KTCoRQi5u/kRd445delJKue+kWfkoHsRsqSVuYmYVJ3eErZHXdnHi
	tIoyGFpV1rjl0w5kctZi1nHjZwB1gCFCVgG9dLwKrdNfS5a1LolfbtiLePXEAoQFVFl0REj8no3
	8obk7285XuanOSNEYUSTSVcwkVPs+TEUBbe641RXkJay+gIRT4Sz+qRJxsYFbC4FMrFTGsWcxJT
	y7Am/jfs/huHdkEGbQedgAqQSK8hLfdnMf7SS62oaGKXqXvrXNjpEoASK2xZ+ntUajSpF1wkxbh
	jb+anDlP6y0UXto5iWv3X7RFWaqkF6XcXNhxN5mjY2KAXt3qb0ZsjFn0Zen4tPjIev9vZqyXjpo
	U1mQyOoyReYg==
X-Received: by 2002:a17:902:ce0c:b0:2ef:e59b:f562 with SMTP id d9443c01a7336-2efe59bf9a2mr1743065ad.58.1794896460203;
        Mon, 16 Nov 2026 22:21:00 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a3797esm8112765ad.31.2026.11.16.22.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:20:59 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net v2] xfrm: do not write the ethernet header when the mac header is unset
Date: Tue, 17 Nov 2026 11:50:46 +0530
Message-Id: <20261117062046.3286096-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

xfrm4_remove_tunnel_encap() and xfrm6_remove_tunnel_encap() restore the
mac header after removing the tunnel header and then stamp the protocol
into it:

	skb_reset_network_header(skb);
	skb_mac_header_rebuild(skb);
	if (skb->mac_len)
		eth_hdr(skb)->h_proto = skb->protocol;

skb_mac_header_rebuild() does nothing at all when the mac header was
never set:

	static inline void skb_mac_header_rebuild(struct sk_buff *skb)
	{
		if (skb_mac_header_was_set(skb)) {
			...
		}
	}

and it does not clear skb->mac_len either, so on an skb whose mac header
has been unset while mac_len stayed behind, the guard is true and the
store goes through an unset header.  skb_mac_header() is
skb->head + skb->mac_header and the unset value of that u16 is 0xffff,
so eth_hdr(skb)->h_proto is 65535 + offsetof(struct ethhdr, h_proto)
bytes past skb->head: a two-byte out-of-bounds write landing far outside
the skb, in whatever object happens to be there.

skb_unset_mac_header() leaves skb->mac_len alone, and of its callers only
skb_carve_reset_headers() clears mac_len by hand.  end_dt_vrf_rcv()
(SRv6 End.DT4/End.DT6) unsets the mac header on the receive path so the
VRF device can rebuild it, and leaves mac_len at the value the original
ethernet frame had, which is how an skb in this state reaches xfrm input:

  tun_get_user -> netif_receive_skb -> lwtunnel_input
    -> seg6_local_input_core -> End.DT4 -> end_dt_vrf_rcv
    -> skb_unset_mac_header (mac_len stays 14)
    -> VRF l3_rcv -> ip_local_deliver_finish -> xfrm4_esp_rcv
    -> xfrm_input -> xfrm4_remove_tunnel_encap

  BUG: KASAN: slab-out-of-bounds in xfrm4_remove_tunnel_encap+0x17d/0x220
       net/xfrm/xfrm_input.c:258
  Write of size 2 at addr ffff88805f85800b by task syz-executor/10831
  ...
  The buggy address belongs to the object at ffff88805f858000
   which belongs to the cache zswap_entry of size 56

The address does not depend on mac_len - it is always
skb->head + 0xffff + offsetof(struct ethhdr, h_proto), since the unset
sentinel is what mac_header holds - and mac_len only decides whether the
write happens.  The value is skb->protocol.  It is two bytes at a fixed
64KB offset, crossing into an unrelated slab cache.

A THIRD SITE HAS THE SAME THREE LINES, in __input_process_payload()
(net/xfrm/xfrm_iptfs.c), reached when an IPTFS payload is decapsulated:

	skb->protocol = protocol;
	skb_mac_header_rebuild(skb);
	if (skb->mac_len)
		eth_hdr(skb)->h_proto = skb->protocol;

and it has its own KASAN report, a use-after-free rather than an
out-of-bounds, for the reason given below.

That function already knows the test is needed.  Its other mac-header path
is guarded by old_mac, which it computes at the top as

	old_mac = skb_mac_header_was_set(skb) ? skb_mac_header(skb) : NULL;

and only rebuilds the header when that is non-NULL.  The site above omits
the same check.

WHY THE THREE REPORTS CARRY DIFFERENT TITLES, which is worth stating so
they are not read as three defects.  The address written is a fixed
skb->head + 0xffff + offsetof(struct ethhdr, h_proto), so what it lands in
is whatever the allocator placed 16 pages past the skb: a live object gives
slab-out-of-bounds, a freed one or a page back on the buddy free list gives
use-after-free, and a different LIVE object gives nothing at all, since
generic KASAN only tests whether the target address is poisoned.  Across
six boots of one reproducer the write executed in five and KASAN reported
it in one.  On a kernel without KASAN it is always silent.

Only write the ethernet header when there is one.  This mirrors what
xfrm4_transport_input() already does, where the header length is taken as
skb_mac_header_was_set(skb) ? skb_mac_header_len(skb) : 0, and what
__input_process_payload() already does for old_mac, and it leaves the
behaviour of every well-formed skb unchanged.

Link: https://lore.kernel.org/r/20261116174531.2540348-2-piyus@iiitd.ac.in
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---

v2:
  - guard the third site, net/xfrm/xfrm_iptfs.c in __input_process_payload().
    It has the same three lines and its own KASAN report, a use-after-free,
    and v1 left it alone - which would have closed two write sites of the
    three while leaving a confirmed one live.
  - say why the three reports carry different titles (slab-out-of-bounds,
    use-after-free, use-after-free): the address is fixed relative to
    skb->head, so the verdict is decided by whatever the allocator put 16
    pages later, and a live neighbour gives no report at all.
  - cite __input_process_payload()'s own old_mac computation as the in-tree
    precedent alongside xfrm4_transport_input()'s.

  No change to the two hunks v1 carried.

Tested at runtime on mainline before and after: both kernels built from
aebb72744764 ("Linux 7.4-rc3") in one scripted run, x86_64 with
CONFIG_KASAN_GENERIC, CONFIG_DEBUG_NET, CONFIG_IPV6_SEG6_LWTUNNEL and
CONFIG_NET_VRF. Six boots each, injecting after the uptime passed 130s. The
skb_reset_mac_len() warnings at include/linux/skbuff.h:2995 are the control:
they fire when the unset-header skb reaches the receive path and this patch
does not touch that site.

                  skb came through   reached the write   KASAN
  unpatched         5 of 6 boots       5 of 5             1
  patched           2 of 6 boots       0 of 2             0

Every unpatched boot in which the skb arrived reached the write; no patched
boot did, including the two in which the control shows the same skb arriving.
The one-in-five KASAN rate is the point made in the changelog about the
verdict depending on the neighbour.

checkpatch reports one thing, the missing Fixes: tag. Neither tree we
reproduced on carries history for these files, so we could not determine the
introducing commit; we will add it if you can name it.

 net/xfrm/xfrm_input.c | 4 ++--
 net/xfrm/xfrm_iptfs.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index 5ed87d513..624ff8055 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -254,7 +254,7 @@ static int xfrm4_remove_tunnel_encap(struct xfrm_state *x, struct sk_buff *skb)
 
 	skb_reset_network_header(skb);
 	skb_mac_header_rebuild(skb);
-	if (skb->mac_len)
+	if (skb_mac_header_was_set(skb) && skb->mac_len)
 		eth_hdr(skb)->h_proto = skb->protocol;
 
 	err = 0;
@@ -291,7 +291,7 @@ static int xfrm6_remove_tunnel_encap(struct xfrm_state *x, struct sk_buff *skb)
 
 	skb_reset_network_header(skb);
 	skb_mac_header_rebuild(skb);
-	if (skb->mac_len)
+	if (skb_mac_header_was_set(skb) && skb->mac_len)
 		eth_hdr(skb)->h_proto = skb->protocol;
 
 	err = 0;
diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa..41af72a92 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -1099,7 +1099,7 @@ static bool __input_process_payload(struct xfrm_state *x, u32 data,
 
 				skb->protocol = protocol;
 				skb_mac_header_rebuild(skb);
-				if (skb->mac_len)
+				if (skb_mac_header_was_set(skb) && skb->mac_len)
 					eth_hdr(skb)->h_proto = skb->protocol;
 
 				/* all pointers could be changed now reset walk */
-- 
2.34.1

