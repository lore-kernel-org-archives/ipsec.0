Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636667;
	b=Rsj0Zq7dTYWH1QAbfWD+0K9e1Cf0YRvA4ZHqOqlEHHTOuHfSYODg2P7JTSI88J8QNHcm
	 8zfA1GyBMmE+VnJW3XOnaowFkmYrRY2m9naQgqHJOVxVz1J6PooMmZyi7upxWwWxxMWEJ
	 iV7AlQKiX4+wQhqBr72qCJ/80hCsQ6x/9AMboPshpZr2kLhSTSQJLSgfShy/Z8CQhfRJQ
	 WI4N0oXgpf+Sc6EAaO0M8QHgFSKwTv8FWTAskyNPj3FZX5AwuWu55c7RNSgdy5ocB26+m
	 YzypQZlmRpFD3MkVmbR4pyAsI5pc6ubXJobo58UP6BT1gjkKU15MV0jqGparGbvHpnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QSbicBCggixQqMOYfUZmOoYxybMhCFwsk9cNA7EU8U8=;
	b=fvHIxSog4Ku1FwPzeAGwXCggJBCD4LqB9zPjncczOWPTGCTYd6P+H2wphEkOBmc/+eHs
	 1LEGOlKBTjBVj/DD8zdOP2y116Bd0qp3hnxtPTXMb15LAQ4NhsICR0xQAHP/uUwk2cnRM
	 5FQr8SN9eCswTaJqMN/A4V4UBM0Z27kbS9hS1sbwXXCebJiVYOYzu4Bd4+gTFXuEfoaXm
	 QbXPm77EbH8/pXZRkbPNLzxvKxF0YG7LfUzDyCB1pc/2/+h5hBbLMRFOEQT879XHM8aw7
	 V0p5b9jquvXT8LlqdjBsOImvmZT4rgD5PKc4W1OwBNoirUmkTQqYc/At8pPFrxK+l1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b="V/h5D4m9";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA76606A327
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 19:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA76606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=V/h5D4m9
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386bd881d39so5353219eec.1
        for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 11:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795636666; x=1796241466; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QSbicBCggixQqMOYfUZmOoYxybMhCFwsk9cNA7EU8U8=;
        b=V/h5D4m9LWZYVbPQL4hOzo3rSURV01oJDqF8b93c8FYFZ/tjW3IXMQH37NpBs37wNv
         B/9cL0LI5xZbmujhZK5/4OracTA50qPkZ8CTvxISIJyUrD3o0Z0pX876xUv6VmMNXvOb
         pPvLF/8syTfaUzhX+WB9uS/fkEBkn6xdQWNFucmsBp6KZAGmgrW2iyiFahp2R0a7flSV
         q56+Le/+omv0DRw9qQuFN5jWI5U4Ec+q/tqPHo1CbbS9AEmQFGIgGvFAger5AQ8DrQcn
         +Y1+JhxtTmFDKvBNlocG2wyoRkSXQ3VPvvhwKsqUynSIIoJXnDfEW0EVLLpvpegzxK5C
         kPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636666; x=1796241466;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSbicBCggixQqMOYfUZmOoYxybMhCFwsk9cNA7EU8U8=;
        b=Q51+5gTY16wXq7H39hrjtQYrh1pVdqdKgRPaUovi/AUZdpF51QHxe/+GYsifu7+aLE
         ldDfFDJbLwecCwq7GEGovHw27EJ64/nAf/RpcZcVA+CEk8RtdPB19+ZFC7cDCq7eYJVa
         FU1bp1DRnUb5rT/chXecVwPvxayxMnjhaGRQPy6NG8kCDkViJ+1vAvF223i8jBclKxMx
         Biv3uMzlzIbgHvXV0HgNPJzgatR9UOdelETDH+5th95XkVjIqaOMhQB7aLSX+v44xADY
         obbG4ja+wQxN4onx3PmcIGQ4hSF60b0U0vkxqsz3VAL5PHwdpu65+nH0HMZyRojYIH2d
         Z9+Q==
X-Forwarded-Encrypted: i=1; AL+hErEJVvuTK/gPbPvaF1CpPdBg34spxYw5z0T9E/w8Rofv5zgm9+EVzEXQHXkEumTcGJRdLHUb4A==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ePrZfyYnaBesi2HP6p0HDdKskg/fXv9teACkeuCSNY4mYnT54
	roP7mcA32Ph32i1OQU18GyawuWItD+oPYSmlMZPg70eVo7sNOrgsAKjdY3bR47x+Zek=
X-Gm-Gg: AZFdTZcjiu5DNIWeG5sW6RO/w/Bdr/X77Bnl/A/Tpfq/QoDArod+jd1Y2AngDpsxi+y
	9fQaxeo81w1hof+vnvfaaMqFjDLmPEbm9e1TF7p4bSoMDLU6Zd0QXs15bPsaNo7+au5f1aWVZ2w
	bJuDRNI3z6YY+Ih2O30z5KkakddacdQRZRa0t56br5FNlKC2i4MseyEmKERzUAyCunWl/iT+5Fq
	7fc6YaobUaro4IqZ5ZULzdv2rLC46ni5PKfXs8rK1yyO5ByjN/NifbFl4pD7/rldnIToTDkl3qs
	YK/r2UUI/C0E7EFpzx23v5FRMCUx8Bxtgccs2zcgUJq2vHVcG9ggrxw2NyupgnO5l41P+wah6YN
	LyC+Xb1lqJeUjPx17Qvb3cTb1W4w2kIEzq7eCA/0zKgWZt/4/pJiDCvKt4L2xqS5A/N30OK+F5P
	7o3S2/EcEwIeiDxTXPkEfd04Hfgpym/u93mI/iGgbEcXhetAyTL2XlPVlvkANzy478OpFpa1uZZ
	RiQJFfJ7314BlETSRMI5zXmZYUjEs+xpcf96gxeDx98yt4U769Z+iSnPZafrC2o2ARsUA9ftiqf
	mJSzm5cezW/LJJys0CyvVjfVrjUBbRfsX/y3ia2h3+5wuPKoSAXkuhoxNKD3JPzoCX69YJB5Xy4
	AEPhQ0ke6toSd1zpmuSPh/WtQ4w==
X-Received: by 2002:a05:693c:69d4:b0:382:90fb:4cad with SMTP id 5a478bee46e88-3856ca9db95mr17568429eec.2.1795636664223;
        Wed, 25 Nov 2026 11:57:44 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm59596522eec.14.2026.11.25.11.57.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:57:43 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: cratiu@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	herbert@gondor.apana.org.au,
	horms@kernel.org,
	ipsec@lists.linux.dev,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	steffen.klassert@secunet.com
Subject: [PATCH 6.18.y 3/5] xfrm: Don't clobber inner headers when already set
Date: Wed, 25 Nov 2026 14:57:33 -0500
Message-ID: <20261125195735.57472-4-artem@trailofbits.com>
In-Reply-To: <20261125195735.57472-1-artem@trailofbits.com>
References: <20261125195735.57472-1-artem@trailofbits.com>
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Cosmin Ratiu <cratiu@nvidia.com>
Date: Wed, 22 Apr 2026 17:06:48 +0300

[ Upstream commit fa90a3145c0340c3f624206a81637c542254ea1d ]

On VXLAN over IPsec egress, xfrm{4,6}_transport_output() blindly
overwrite inner_transport_header (== the inner TCP header saved in VXLAN
iptunnel_handle_offloads() -> skb_reset_inner_headers()) with the
current transport_header (== the VXLAN outer UDP header set by
udp_tunnel_xmit_skb()).

This was a latent bug, harmless until commit [1] added a doff validation
check in qdisc_pkt_len_segs_init() for encapsulated GSO packets. With
the wrong inner_transport_header set by xfrm, qdisc_pkt_len_segs_init()
interprets inner_transport_header as a TCP header, reads doff=0 from the
upper byte of the VNI and drops the packet with DROP_REASON_SKB_BAD_GSO.

Besides the use in GSO to determine the header size of segmented
packets, inner_transport_header might be used by drivers to set up
inner checksum offloading by pointing the HW to the inner transport
header. A quick browse through available drivers shows that mlx5 uses
skb->csum_start specifically for this scenario, while others either
don't support VXLAN over IPsec crypto offload (ixgbe) or the HW is
capable of parsing the packets itself (nfp, Chelsio).

But in all cases, it is more correct to let the inner_transport_header
point to the innermost header instead of overwriting it in xfrm.

So fix this by guarding all four inner header save sites in
xfrm_output.c (xfrm{4,6}_transport_output, xfrm{4,6}_tunnel_encap_add)
with a check for skb->inner_protocol. When inner_protocol is set, a
tunnel layer (VXLAN, Geneve, GRE, etc.) has already saved the correct
inner header offsets and they must not be overwritten. When
inner_protocol is zero, no prior tunnel encapsulation exists and xfrm
must save the inner headers itself. The tunnel mode checks are only
added for completion, since they aren't strictly required, as
xfrm_output() forces software GSO in tunnel mode before encap.

This makes the previously added test pass:
 # ./tools/testing/selftests/drivers/net/hw/ipsec_vxlan.py
 TAP version 13
 1..4
 ok 1 ipsec_vxlan.test_vxlan_ipsec_crypto_offload.outer_v4_inner_v4
 ok 2 ipsec_vxlan.test_vxlan_ipsec_crypto_offload.outer_v4_inner_v6
 ok 3 ipsec_vxlan.test_vxlan_ipsec_crypto_offload.outer_v6_inner_v4
 ok 4 ipsec_vxlan.test_vxlan_ipsec_crypto_offload.outer_v6_inner_v6
 # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0

[1] commit 7fb4c1967011 ("net: pull headers in qdisc_pkt_len_segs_init()")
Fixes: f1bd7d659ef0 ("xfrm: Add encapsulation header offsets while SKB is not encrypted")
Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
 net/xfrm/xfrm_output.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/net/xfrm/xfrm_output.c b/net/xfrm/xfrm_output.c
index 262eea7bdea3..433ce19c2900 100644
--- a/net/xfrm/xfrm_output.c
+++ b/net/xfrm/xfrm_output.c
@@ -67,7 +67,9 @@ static int xfrm4_transport_output(struct xfrm_state *x, struct sk_buff *skb)
 	struct iphdr *iph = ip_hdr(skb);
 	int ihl = iph->ihl * 4;
 
-	skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	if (!skb->inner_protocol)
+		skb_set_inner_transport_header(skb,
+					       skb_transport_offset(skb));
 
 	skb_set_network_header(skb, -x->props.header_len);
 	skb->mac_header = skb->network_header +
@@ -168,7 +170,9 @@ static int xfrm6_transport_output(struct xfrm_state *x, struct sk_buff *skb)
 	int hdr_len;
 
 	iph = ipv6_hdr(skb);
-	skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	if (!skb->inner_protocol)
+		skb_set_inner_transport_header(skb,
+					       skb_transport_offset(skb));
 
 	hdr_len = xfrm6_hdr_offset(x, skb, &prevhdr);
 	if (hdr_len < 0)
@@ -277,8 +281,10 @@ static int xfrm4_tunnel_encap_add(struct xfrm_state *x, struct sk_buff *skb)
 	struct iphdr *top_iph;
 	int flags;
 
-	skb_set_inner_network_header(skb, skb_network_offset(skb));
-	skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	if (!skb->inner_protocol) {
+		skb_set_inner_network_header(skb, skb_network_offset(skb));
+		skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	}
 
 	skb_set_network_header(skb, -x->props.header_len);
 	skb->mac_header = skb->network_header +
@@ -322,8 +328,10 @@ static int xfrm6_tunnel_encap_add(struct xfrm_state *x, struct sk_buff *skb)
 	struct ipv6hdr *top_iph;
 	int dsfield;
 
-	skb_set_inner_network_header(skb, skb_network_offset(skb));
-	skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	if (!skb->inner_protocol) {
+		skb_set_inner_network_header(skb, skb_network_offset(skb));
+		skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	}
 
 	skb_set_network_header(skb, -x->props.header_len);
 	skb->mac_header = skb->network_header +
