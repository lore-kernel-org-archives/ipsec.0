Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574558;
	b=1vfku0zrC9HT1pvfIIPbgnGiuplVX15KaSHF0uAU49WP5z4O+bhIp2871TFiQM9FU5tE
	 ukw9adjzkW7PCkfzQ2+GGsyrhf9NSa3Dje2M/EW6uGJ/4VRdBGZs4XFv9daoOpOXAwGdk
	 1HczOt4Rkg71NeOU2eMIgxEVBj6ghHZtd3EwzH7NXWCs3vwDMWXGPJ8Yrtdy6b6sJSH6x
	 xzSA3nXek3dnB5/IKznWvtIsd4jo32onL/2DCBidITkdxtR+QQDqSqCodRXGHY7eT0FaW
	 SfI9DkG2InVjPWH8kPdTCT50Sh5nj8e5PI5+YIpkt6jA2T+GAHaUgEgddpaFAf9+uVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mEExPnF37SF6L15+U7oygTLDkR+EbGh7oqFgruuLRMI=;
	b=Zi/ePWIMUe+J7bcN63nj3pnhE/N/fuZ6G9dFjUojcd9PO/97qaAwS1fdDjAC2mAb107J
	 XAT/H4dW0284ScarHarPxNnZuN/Jopi6kF9sbo+9LceJ4kAO3SPApUEMjOO02bfuVT3Up
	 c3udsrBo/WHsKNxstRA0cIMOn45y83PGPoTwyqbqDh/8k73GidFwokBCzpyfFxOTfyw5a
	 pkjoLpe5sroaF9GoQjZFIeUB3UaB/sZ+vA8jOAJOzLVAoFZL1GgPyyMXaR9uoZtQBZaqs
	 SExm83QjEnRqt0M8vPra73dT47xlqWwDnCdD07OoTwkiRf72FC01D+Y1IvPfpRzw/2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxCGV5b3;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CA6606A693
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 02:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3CA6606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxCGV5b3
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso2104398a12.3
        for <ipsec@lists.linux.dev>; Tue, 24 Nov 2026 18:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574557; x=1796179357; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEExPnF37SF6L15+U7oygTLDkR+EbGh7oqFgruuLRMI=;
        b=MxCGV5b3NnkdyGriA33iRnhIiWqwf/MgHAWcyDP8DbMXhnqVWNXFD5lpqU96i3ZKcb
         /vOPPRDw2ShtdZmseciOvUlXz0GG3MG82MNMK7+gFJhLFIyGFZPK/fetw6ke2Ahcs6mS
         rDmWG5BkrFQnq5jLYrAZI8P4zAark9cjUfWro6yBb1FIR8w59M3zgQ95D1YHR+nDxKdx
         fcez5/x6uaHPioY/oZlkpxukyK1heg6FsKmhgO43G2VyVgGL0TCQ121sb+/GvXvsuacb
         oHv2XysPaTQ/S0g8ERusGqSdoi05aSsyEN8zIuJlKPvozjz4XGmagKjaqxsvyJjtyvLd
         jkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574557; x=1796179357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEExPnF37SF6L15+U7oygTLDkR+EbGh7oqFgruuLRMI=;
        b=PP5XdqXiO3HHgeueiatilVfzbbMNXlfin9s4QVd7CEU24dM8O3JHOpZW1/uLxvamBs
         veAojdFLDCfkCUI6yagzk5DPKebCkWyjOm6G+9+SspPwrLWSovS0wLP4/grfU1OvXoXg
         JF+ToqV5qm3YVxnzGYtORZIYcKB6tdKEFdqCH+Pj7FCipdbO65IcAqe3dIE5IpF3KeKX
         S7Yk6i2cwgMKkynGpoQnbcGrvPTYwycEIccVzD/ZPXulhUcvSWOZJcpD90H0J3LHLhfz
         F8TQGhbGC56mWTal2zRUV27jra29Pp4NktGxh21ShM6jvgIuHLk3yJGu6cOoMuBw3KH7
         8TPA==
X-Forwarded-Encrypted: i=1; AL+hErGz4XqFeuNbAsxy6/2DbrWvO2wwKjhbOwDLbKhXXGXE8KPfWt5b3vTdyiPuxbbuwcWcyS0EHw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Yj31G7+8DN1bXgoSWj2AZdxN7YZWjp3wF5yGM7SKzZZqE085m
	e6tV+WlDJ0VJs6FD7UKqab/cSkMNPZ8P6wEnOmqwYSbqjFrxP8Kgl0zp
X-Gm-Gg: AZFdTZeFtS4szuf5bdJhJjc0eTpLa6XRlM9bj+UVyYvrUwpUMWdP+MurDkJgCjBSdtH
	v5skCYE8HdSglzIeZmLLWmggNThT4Ro/L3saLlGqNvLYq9+3CWTbeOGeNSFEUzod1Hbc/XG6F+I
	kxPGFWsOqE5r62mkMZJ1UMDKjrl4UibtunHyf1B3wEa7Tg+YPduGLJQAMW31mrKpRktrBQOCdrf
	EWDcMmTiWupQmExQgrVHM7vdGdnr8bSv8SUbo0frrQSBTtTyIxoDhH2sOEEsIDrp9glojwZi28a
	3RNZfIlFKuBaeAmdwaQKkB+d8iIEUtv/Ic0xgF2zTplCzzEFqL40TZlAvo80dfJ50bjgtuIEKqw
	nyUKO90jDHC1Ta6qITmOXDOx3JQ96s6hV7CKdmNT9anhAQaDEzeMu1Zrxy+dpxiDeruDa+odYtA
	RJBd8tz7w2pwg3I4mxRHslrdiYqQuTCE3oqe0lh+laDL/xSgEYo1hsfdFFRm9EoFn2qc/xCBQa6
	XFQMSbdoyDsIZlhqznmQyNC3Lm4zFM7mocetqwH0UHKB2IHhZ9BN5JGUdpCI2VZZrfSLAjgpVLM
	S0OTQxtaesSOORw7QksXiJzi6jk/etb3kPqF53eK+mwkRoFWxTat0V08aqtNl3EX9L4=
X-Received: by 2002:a17:90b:3f43:b0:3b4:e97:22ec with SMTP id 98e67ed59e1d1-3b41c931cfcmr16259721a91.35.1795574556864;
        Tue, 24 Nov 2026 18:42:36 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm25727086a91.6.2026.11.24.18.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:42:35 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Hui Peng <benquike@gmail.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 2/2] xfrm: refuse modes that AH and ESP do not support
Date: Wed, 25 Nov 2026 11:42:28 +0900
Message-ID: <e5abf3005007d9bf3eab4b640d513856f8eacf6c.1795573672.git.kyuwoncho18@gmail.com>
In-Reply-To: <cover.1795573672.git.kyuwoncho18@gmail.com>
References: <cover.1795573672.git.kyuwoncho18@gmail.com>
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

ah6_init_state() refuses any mode but transport, tunnel and BEET, but
ah_init_state(), esp_init_state() and esp6_init_state() accept any mode
and only adjust header_len for the ones they know. For ESP over IPv6,
a state in route optimization mode then reaches the WARN_ON_ONCE()s for
unknown modes in xfrm_state_mtu() and xfrm_inner_mode_input(), as long
as verify_newsa_info() lets the mode through. Over IPv4 there is no
route optimization mode, and __xfrm_init_state() refuses it before the
type is set up.

Make these functions refuse the modes they do not support, as
ah6_init_state() does, so that each type checks its own modes. ESP
keeps IP-TFS.

Fixes: c2d305e51038 ("xfrm: remove input indirection from xfrm_mode")
Fixes: c7b37c769d2a ("xfrm: remove get_mtu indirection from xfrm_type")
Suggested-by: Sabrina Dubroca <sd@queasysnail.net>
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 net/ipv4/ah4.c  | 11 ++++++++++-
 net/ipv4/esp4.c | 18 +++++++++++++++---
 net/ipv6/esp6.c |  6 +++++-
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/ah4.c b/net/ipv4/ah4.c
index 6fd642d2278d..32094169718c 100644
--- a/net/ipv4/ah4.c
+++ b/net/ipv4/ah4.c
@@ -535,8 +535,17 @@ static int ah_init_state(struct xfrm_state *x, struct netlink_ext_ack *extack)
 	else
 		x->props.header_len = XFRM_ALIGN8(sizeof(struct ip_auth_hdr) +
 						  ahp->icv_trunc_len);
-	if (x->props.mode == XFRM_MODE_TUNNEL)
+	switch (x->props.mode) {
+	case XFRM_MODE_BEET:
+	case XFRM_MODE_TRANSPORT:
+		break;
+	case XFRM_MODE_TUNNEL:
 		x->props.header_len += sizeof(struct iphdr);
+		break;
+	default:
+		NL_SET_ERR_MSG(extack, "Invalid mode requested for AH");
+		goto error;
+	}
 	x->data = ahp;
 
 	return 0;
diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index 111bea0bd260..1bb7c4b24cc6 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -1148,10 +1148,22 @@ static int esp_init_state(struct xfrm_state *x, struct netlink_ext_ack *extack)
 
 	x->props.header_len = sizeof(struct ip_esp_hdr) +
 			      crypto_aead_ivsize(aead);
-	if (x->props.mode == XFRM_MODE_TUNNEL)
+	switch (x->props.mode) {
+	case XFRM_MODE_BEET:
+		if (x->sel.family != AF_INET6)
+			x->props.header_len += IPV4_BEET_PHMAXLEN;
+		break;
+	case XFRM_MODE_TRANSPORT:
+	case XFRM_MODE_IPTFS:
+		break;
+	case XFRM_MODE_TUNNEL:
 		x->props.header_len += sizeof(struct iphdr);
-	else if (x->props.mode == XFRM_MODE_BEET && x->sel.family != AF_INET6)
-		x->props.header_len += IPV4_BEET_PHMAXLEN;
+		break;
+	default:
+		NL_SET_ERR_MSG(extack, "Invalid mode requested for ESP");
+		err = -EINVAL;
+		goto error;
+	}
 	if (x->encap) {
 		struct xfrm_encap_tmpl *encap = x->encap;
 
diff --git a/net/ipv6/esp6.c b/net/ipv6/esp6.c
index b287c807b018..ced910d44b47 100644
--- a/net/ipv6/esp6.c
+++ b/net/ipv6/esp6.c
@@ -1192,12 +1192,16 @@ static int esp6_init_state(struct xfrm_state *x, struct netlink_ext_ack *extack)
 			x->props.header_len += IPV4_BEET_PHMAXLEN +
 					       (sizeof(struct ipv6hdr) - sizeof(struct iphdr));
 		break;
-	default:
 	case XFRM_MODE_TRANSPORT:
+	case XFRM_MODE_IPTFS:
 		break;
 	case XFRM_MODE_TUNNEL:
 		x->props.header_len += sizeof(struct ipv6hdr);
 		break;
+	default:
+		NL_SET_ERR_MSG(extack, "Invalid mode requested for ESP");
+		err = -EINVAL;
+		goto error;
 	}
 
 	if (x->encap) {
-- 
2.43.0

