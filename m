Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515213;
	b=U15+SgY3t6tWDE5cy/h1uLzXOAlyqQs7H7cg/J2oTvqzIg8vG0xdFPtjBnPnKBYdVjn2
	 S5NCGdoMEMlmoAAuIJtzxiaO0Z9cvYggQjC9FoUp2iuQjUZ/NJ5rS61czqxxI4PqSY25a
	 A6bUB15Nh4Mgf/CzK25cOFcVaopesGr8WQJoFm/fD0T3Sh7/A5EGfn9uOp0BXcqSQuI2b
	 BMvn6gvWmceysfO/X/9+YfGPkXbknRqRtec1HvH5r5f5AQKUCPGlvE41V6DJ291g1K/HX
	 FvBWS6BpWjqmE1YKCqXg0Mu/9HJTDzOlF4/3hL76r2vU+b4XBBrDSI/3NjdZtu4nk+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515213;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LUiapgFv2s7Cz91vipT+eU0P1TswhGJ/9RCdWiz4M1U=;
	b=hG/gXJe4MQjWXiEI/7wSccFNTPFZJwHjL/l5PSfg2g45P4pN+BOeHOv8ByB4XGVu51rY
	 c8x9+2jRFrGZUyvXdU3mqPv6O80g29x6WFbF2P/HQfc+7h++SckXsDB6ClUGbJ7Jtddwv
	 6pFOSPjL9U79fbUy27i7Mdz1Ni2ZrxEZyJgfB08YH0IRVWBSm2twqw0IC7vddhgCwJxb5
	 aQqibG32FRIz9LgSmgCcZLfkaaZIU/gqgyt71qNazUHqeLzujeGaG9mJw1hFJWNmskG64
	 x9NlNrQMYTLyZeTmuqZN/hcdxox7GT+AQ/R+vo5C5D9ga6x80anX3BcsJfKxMRmSGoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=queasysnail.net;
	spf=pass smtp.mailfrom=queasysnail.net;
	dkim=pass header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b="Nj/0y5s+";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=L9zegxUP;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA64B606A687
	for <ipsec@lists.linux.dev>; Tue, 24 Nov 2026 10:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA64B606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=Nj/0y5s+;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=L9zegxUP
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B756614001F2
	for <ipsec@lists.linux.dev>; Tue, 24 Nov 2026 05:13:26 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 24 Nov 2026 05:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1795515206; x=
	1795601606; bh=LUiapgFv2s7Cz91vipT+eU0P1TswhGJ/9RCdWiz4M1U=; b=N
	j/0y5s+8e4TttaMsjjhWwCTX3fh7I0Gt7wAEGkZulRXhOP5V9yK5p3IgpiZWQepG
	8ufiplg+hTA4HLPmfx4JgLNBo9g9Bhw5UamsO3vqpQpFz1zcuVMPx+9XUDD2ydmQ
	bjQwARIE0LyThXLW9GlMuUQ/2mgnZsHTmpo0o70BPMqdDzeO1kJlB2alT0eYNBDf
	uoVd88m0ptHoDtZKvSStRb/SDXfksUHZGshqnL/BWuVJMoGRDWcyM7eaHfRfvMyd
	SCjr367dMhfN5IXsOy5mAoZpvm0qmR+upH/MKIpuysGwtNvx6c/Gb+tB+CdxYQZ2
	ZN6bzsVRXSrZ9CdLP3z7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795515206; x=1795601606; bh=LUiapgFv2s7Cz91vipT+eU0P1TswhGJ/9RC
	dWiz4M1U=; b=L9zegxUPFQWRnhYK7uVgP2l50bye/IJOUCVAvSxtR+Dot14/wes
	8BbOkI3yBdtfDKQI7gxtLkROaJRIrOdBxh/Tk95f/nbG42jpEsZZ39inSm45W0ar
	I46MTrQroiVrGlh4kg3qD6MJl7PIVIf13cnY8k+ZKzMY0qPwoFCTumjVhfj0EF45
	u5u8bJPb5MhU5ViuxAZtU7zLPBzVvRu79sGiRDQ7wOCCpHcetrn89urkyczqvOVJ
	G8YpZ/s6ODzRBt0A4bPK0Vsleureq7rkr03UIDvrZ2f0OtHr9hId2D+fr5JrODSq
	2MkJimEwvbt9u1v5hJbFf+WQRxOQeRpryIg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795515206; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PGlwc2VjQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm1:rsa-sha256:sKSnH058RrXe0QCbUW0rSHKhgL+ELtfRhoy0zIAJI0nJ5uu
	dHgorMSZPiRxW2rIzQy20Ta62WUyARDc4SHslV+3KdjIYoDea1ISJDmotY5Ck5oP
	Zp+8v+zeKrtq3QdtnWYQdHXMaI1FNkCR0j7CRpSXnJcjgstemyXWD7WUaYZK0EU6
	xtip2MaeqU0Hb8oAmLa1cbwJyp6Vq84xRZJTgtk2uPA7greaNzfpL2BREgc7jXOQ
	tgIwhFcMmJR8RX3oh8l4gcRR0UNG8afv1nBhIWeL4bfI1MtyCOhi7TnCXH002I0z
	di9BjsnBY1ej6zMT4Egv4zYBptM0bv+DH+aQ8Bg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XGq7YO4qTM0jBsvucew+q+U6y8Y67SvxXoyOifFsYnY=:K6Iy10X/R67a2aBlW39K1qryiE9RLNi0DyRWhcYeBPc=;
X-ME-Sender: <xms:RGMFa6uZHQYR-AaDbWk50DAjjuDCRfk-QDB6TYsqWU566q5mkXjKRw>
    <xme:RGMFa0pXzlblCw5NybEkqUQ7wVYbzx-WZM4gEtp_MZ2eeJLedQDK960WYLMW_nfL3
    psZbCoPQxZJT0Rajjp0sFOcPxWhCoCKFJtnu27ZgB6A90-BOIkyVfc>
X-ME-Received: <xmr:RGMFa5Iu6htMmy-PKSZnelOGs88Ahyzb1m3djuUfJaudXK0bKPrgV7VLEzE>
X-ME-Proxy-Cause: dmFkZTGmhsSiOGHtwbWTJ7RXoFsZWmzIF9cXlWwfaL/dh9WORGxQtof0HdyIt3cLmdUuJ8
    VsOAGmm7+V3c5JyXAZ/yigVQUYNf6o0hNZqJJnZ9XmbeJaAyTTnJUpPYOckWNfKNVes6Mr
    gr4HWTmYoFlBNeBNvu14FgO+RbLIIRR6wWxPcTmJPz3FHdXR3H+QHanIDZWH38qbbm5yx2
    eql/7WnABytDiZuWfe9NtU7xNCTN3eate9S2tVozDRmigqmwgsPCGyLDjW89meOAwy9i+C
    YSHMiS6QOem3k3KKTaUbsyZ8Xx3M7NvQBGqfzd9DnGX4/bnY2KUwR7rYyd9Y5K7/CvXkNL
    vZJbpJOFw0hmGpL/mm3/8GGTPAESAKZhHT1iTr5tOIlGqdvLJmovp85uKxkC5PNAxwnrZK
    AhPR+IpYHFw7aFxmNaySJhqP2hTuDpCpAyWszk6s7anBUksTwyCW99FTyxtnM6W9XU6tEd
    4SszOEMw/GgryseHVRnTuNQEMexElNoEJkdufN38bAXGWSs+fqnh5kaUSP9kgJo/Vi3A6c
    pSWr6b18TeahYFAJZVcMe68tHnLegyl6BTXvXC3p50THOVX+K4kdeMGc6/VIGgKIv8cxC4
    LchfkwpM8QCFkI0InHHHOARusFZrXHlt2I6znASTQo/2CEi7FFr8YrIQrF3A
X-ME-Proxy: <xmx:RGMFa0s_Q3HRezrimIll11g8GX53109HCykwpzw8TTjcHZpPXIlzhQ>
    <xmx:RGMFa2DoHurVpOZj0Bpu9mynMyAYUWQnX8L8rYRHiYeScLARIyeuvg>
    <xmx:RGMFa86wTy1NVapjcF0IRfzMS9me0CNDn1iwOUD0LFQQbHF6Q_zulQ>
    <xmx:RGMFa-DsasiP_rTnXi_YrfDrl2Wm6Xsl4siJ4pV51i-8j6acpoJ5Ag>
    <xmx:RmMFa1Edqks_cuBp6BmHwTk_K5arWLy7MdY_TVxqiciAgz-IiCzFElaN>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 05:13:24 -0500 (EST)
Date: Tue, 24 Nov 2026 11:13:22 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
	Hui Peng <benquike@gmail.com>, netdev@vger.kernel.org,
	ipsec@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH ipsec] xfrm: allow route optimization mode only for
 DSTOPTS and ROUTING states
Message-ID: <awVjQipfDmyOZZtw@krikkit>
References: <179550330841.535592.4607028415857424638@gmail.com>
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179550330841.535592.4607028415857424638@gmail.com>

2026-11-24, 16:08:56 +0900, Kyuwon Cho wrote:
> verify_newsa_info() accepts XFRM_MODE_ROUTEOPTIMIZATION with any
> protocol. esp6_init_state() treats a mode it does not know as
> transport, so an ESP state in that mode is created, and the first

nit: I'd say it doesn't really "treat" it as transport, it accepts
everything and doesn't adjust header_len.

> packet through it hits the WARN_ON_ONCE()s in xfrm_state_mtu() and
> xfrm_inner_mode_input(), which assume that route optimization never
> comes with ESP:

Looking at the list of available modes (include/uapi/linux/xfrm.h),
what about XFRM_MODE_IN_TRIGGER?

>   WARNING: net/xfrm/xfrm_state.c:3264 at xfrm_state_mtu+0x239/0x3d0
>   RIP: 0010:xfrm_state_mtu (net/xfrm/xfrm_state.c:3264)
>   Call Trace:
>    <TASK>
>    xfrm_bundle_create (net/xfrm/xfrm_policy.c:3992 net/xfrm/xfrm_policy.c:2785)
>    xfrm_resolve_and_create_bundle (net/xfrm/xfrm_policy.c:2885)
>    xfrm_lookup_with_ifid (net/xfrm/xfrm_policy.c:3114 net/xfrm/xfrm_policy.c:3245)
>    xfrm_lookup_route (net/xfrm/xfrm_policy.c:3344 net/xfrm/xfrm_policy.c:3355)
>    ip6_dst_lookup_flow (net/ipv6/ip6_output.c:1299)
>    udpv6_sendmsg (net/ipv6/udp.c:1699)
> 
>   WARNING: net/xfrm/xfrm_input.c:449 at xfrm_input+0x2176/0x5f50
>   RIP: 0010:xfrm_input (net/xfrm/xfrm_input.c:449 net/xfrm/xfrm_input.c:705)
>   Call Trace:
>    <IRQ>
>    xfrm6_esp_rcv (net/ipv6/xfrm6_protocol.c:119)
>    ip6_protocol_deliver_rcu (net/ipv6/ip6_input.c:479)
> 
> Accept the mode only for the Mobile IPv6 protocols, as IP-TFS mode is
> already limited to ESP.

This is reasonable, but I think we should instead (or maybe "also")
add mode filtering to each ->init_state. Most already do it
(interestingly, ah6_init_state does but not ah_init_state, can AH4
also land in the same WARNs?), I think it's just ah4 and esp{4,6}
missing those.

-- 
Sabrina
