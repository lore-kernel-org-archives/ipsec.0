Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574554;
	b=ZoP3L04iZXMTn4gTBwCe5ESJM/6WA0I4blVRPhaJMuAt6bAOO0rEb7NYqZ7NEMv7SeYz
	 KD6MeJCPbFVvLWmyehxhDRrQ+o3XPTK7ku61k+XNaDhGqusyVVfmI6WAkoazoVZ+h/Ez6
	 6lWDQJEsKtrNIQI37P3OJXQWUOea8Ka+LIoTT7Gixh7I+d5TlCHjQs+K29cIK4nhaOFx3
	 XAW36+L00EiSYNq1vZzmrxw7zEhSXIWnCM/onhWXmcXVDuQXChH32mHqqqHuKIAisE+UA
	 dEw8Y5GB1Kyr/HmecPcKeiZ9quWKHjtxJ+tgginXd/qSjBh9IsvGduzoaSEAg+/QzJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+vLaUSGVzrenn35n8wMC/NJVDqhs0L2Vc/oVTJI7Ix0=;
	b=EaXJ7BPJoCPDnYWhDQ4WTLhU+I+L8gmN8ARU3j0gyRYtYf9qgtTIlTjCeXQc2uoYfOXy
	 UJTQOaJPU/35GxdX8v+k4nTPfJxD1bke19ixsDdcXZOct34cmiBcmQ0x2yOJjuytM4d4t
	 6ZYQj7uCtjOVov7U1GQnNjx6gsj4aPeoTatUuw52ML4m1OPpGhhaRr0U0t9eTvGzBdD9F
	 7vp9oP/QllDM8hhf7b58h4y3ugnnwdNhahON9SL2M6nk3V/HaVkUM6w/IT6+8N6N9NJJO
	 CFHtEiFL02JA7XF4qOS1Adn6AXpXDcf+q+0htnr8UkgKAHGRIzxmko76kMcxv9bHoKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifDHb4c0;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C276606A321
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 02:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C276606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifDHb4c0
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so3049062a91.1
        for <ipsec@lists.linux.dev>; Tue, 24 Nov 2026 18:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574553; x=1796179353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vLaUSGVzrenn35n8wMC/NJVDqhs0L2Vc/oVTJI7Ix0=;
        b=ifDHb4c0frA8g3b76SBUgg/J2WuY09o+jm4cIOQnG5VFYERzixjrJRcLk/r1BIU6c7
         yKs+nsHTiphi+7QF6Mcncp+FcmGgI/Av5qM7U/5r/7juFuAzOlrwjVYgPxXxSR4RfZzz
         /V4H60eaJzhgyawc2bfJzbiasy1GoZDGwdFNmgM2WyVoURrz45lFPZIO31gbbvLBIr8W
         trGjbUCAaNkhZhyZsvT84Cc+KR7YDXrCW5efH+IIsfDMFhFFFWEy13AXMh2sLL9Cmsi/
         XokP7xTr6ES2AtJT2RXC4djed9TfsNvhgCOV5F4kXAaPGXUbL/i1sJLoS1vnSeoWqz1r
         3dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574553; x=1796179353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+vLaUSGVzrenn35n8wMC/NJVDqhs0L2Vc/oVTJI7Ix0=;
        b=EHVX0HQBbGxEltWR+oON1btnXQeEIBgLLXbzhKxmiWUP8Ij3zhKLeMWqduf4DDMWc1
         WsRPZ8DWSS6MA1tAkO/HrqcF7eKfHh3eTgmSDZuIretXcDGU0vknoCqA5/m5OpryU5dQ
         4I0wP68xp11BMzKDK7hULPmTdyZOhURkrDP4sFCP31RRGzOHQw9Uu9AyAN7xWQd55MsS
         XGEF1ZaPnanndXAaNzkqYPZkz9MSXNI9yYpea71u64Pyx429cHgpMTmF20WHjKMOnaHK
         d/zmt93QC9VR5hEsP2fhyYnmkknESBMVXpNAnN/oZgyPVK0esxjjye1kDvvPOvjwmbZj
         8zpQ==
X-Forwarded-Encrypted: i=1; AL+hErG6Sg/N3xjxKBgEmmPsGzxjv/UsTOMbr6FAX+qRm+Fap7Ua0nDub/yNB9nIWb/iD1tpRJ1LqA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8zDEJJhmtXcd+0sbMfQPNdo+ySgLiCevoLbc+IR9IgQGaBsQmJ
	ZN85em+wbxhZbRMC+hHX4ieRhUfF/D/57f01XNLcWfjeQi4YQFqcDjnA
X-Gm-Gg: AZFdTZc6w/JlySlYkB0OppKwcC+0y4QU28ipQ7wWB+AhO7VPXfwuIMnNyqKO5cQZWyK
	GfWuGcJeArHmHDZqYkm0W0kIpw6iH9ZL02q0Tq/fkZIK2jSKKZOwcPm7F/51h2v/EFQR09jRAFK
	c4PyHWbZn4mCihYoaX1C8IxBtFDEFREgqDR8tfLG7NgV91s3D2C7CJtrzWeOwIVz1lsqbUpbcpG
	MKw6X/j8F9ceNzKudT8fiSIoi/5VVepoLyvkC7dcDDreRwcXYeNbsV1ok0bAg/aHThuVMyKQ6i2
	vcYGeBbylvolS4kiMElwSI+jS47VbU5Yc5Y39DlzbhW0Wyszvdvs+5RFtHBwsB8gjbUPpYvCC8u
	XEoiVG4TjpqblGxIVjIpcldweQuL7VmTwqo3IhEG1pTQBfcNfH61adES9Ju41ksZQduBfv6M1cI
	MFX9zB8Rr4SVzxGHxZY61s8kWZtwcFQeSD/Hn3bkbYK4NXRuQzpMpdCPtzTSR+/PYl5lXb1mWj4
	IUuKaeyYI01zU0G62/xDQiypxbVqkJfRzLjqGjCmOLA8RWHVCAtGWO6Rd5X9WYKfW85+LTlBD2k
	r2yR9BKaBTIjx/9jbcJjvAGlM40mH5VgReCiwrnKniVQlppJoFNwHeZiFv9MwyOiPgc=
X-Received: by 2002:a17:90b:3f43:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3b41c8e0512mr10754930a91.15.1795574553339;
        Tue, 24 Nov 2026 18:42:33 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm25727086a91.6.2026.11.24.18.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:42:32 -0800 (PST)
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
Subject: [PATCH ipsec v2 1/2] xfrm: allow route optimization mode only for DSTOPTS and ROUTING states
Date: Wed, 25 Nov 2026 11:42:27 +0900
Message-ID: <c1901b79c9de8fad23fecb49f1d4ab7ecdf04f57.1795573672.git.kyuwoncho18@gmail.com>
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

verify_newsa_info() accepts XFRM_MODE_ROUTEOPTIMIZATION with any
protocol. esp6_init_state() accepts any mode and only adjusts
header_len for the ones it knows, so an ESP state in that mode is
created, and the first packet through it hits the WARN_ON_ONCE()s in
xfrm_state_mtu() and xfrm_inner_mode_input(), which assume that route
optimization never comes with ESP:

  WARNING: net/xfrm/xfrm_state.c:3264 at xfrm_state_mtu+0x239/0x3d0
  RIP: 0010:xfrm_state_mtu (net/xfrm/xfrm_state.c:3264)
  Call Trace:
   <TASK>
   xfrm_bundle_create (net/xfrm/xfrm_policy.c:3992 net/xfrm/xfrm_policy.c:2785)
   xfrm_resolve_and_create_bundle (net/xfrm/xfrm_policy.c:2885)
   xfrm_lookup_with_ifid (net/xfrm/xfrm_policy.c:3114 net/xfrm/xfrm_policy.c:3245)
   xfrm_lookup_route (net/xfrm/xfrm_policy.c:3344 net/xfrm/xfrm_policy.c:3355)
   ip6_dst_lookup_flow (net/ipv6/ip6_output.c:1299)
   udpv6_sendmsg (net/ipv6/udp.c:1699)

  WARNING: net/xfrm/xfrm_input.c:449 at xfrm_input+0x2176/0x5f50
  RIP: 0010:xfrm_input (net/xfrm/xfrm_input.c:449 net/xfrm/xfrm_input.c:705)
  Call Trace:
   <IRQ>
   xfrm6_esp_rcv (net/ipv6/xfrm6_protocol.c:119)
   ip6_protocol_deliver_rcu (net/ipv6/ip6_input.c:479)

Accept the mode only for the Mobile IPv6 protocols, as IP-TFS mode is
already limited to ESP.

Fixes: c2d305e51038 ("xfrm: remove input indirection from xfrm_mode")
Fixes: c7b37c769d2a ("xfrm: remove get_mtu indirection from xfrm_type")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 net/xfrm/xfrm_user.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index 217f65faa2bd..c4bbfd638d73 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -477,9 +477,16 @@ static int verify_newsa_info(struct xfrm_usersa_info *p,
 	switch (p->mode) {
 	case XFRM_MODE_TRANSPORT:
 	case XFRM_MODE_TUNNEL:
-	case XFRM_MODE_ROUTEOPTIMIZATION:
 	case XFRM_MODE_BEET:
 		break;
+	case XFRM_MODE_ROUTEOPTIMIZATION:
+		if (p->id.proto != IPPROTO_DSTOPTS &&
+		    p->id.proto != IPPROTO_ROUTING) {
+			NL_SET_ERR_MSG(extack,
+				       "Route optimization mode requires DSTOPTS or ROUTING");
+			goto out;
+		}
+		break;
 	case XFRM_MODE_IPTFS:
 		if (p->id.proto != IPPROTO_ESP) {
 			NL_SET_ERR_MSG(extack, "IP-TFS mode only supported with ESP");
-- 
2.43.0

