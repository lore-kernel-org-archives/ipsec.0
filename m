Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515539;
	b=pwEmyq0MlM6vi1VbKP14sEjqoOLDaHxU45Ri3nu9tZ7eltXJmOhoOS9PusN8gntuxm/u
	 WFQ+DlHtQvKCyHvMMLwIwbt5utK0wfEZDpP0on7Nnjq6HAvT3ICLFJwZ+wABuXvZ3fr3E
	 S1RyZx8yltmEycUb754qi1lxY+4nPRbRfHJ3v2kYWu48NM+4pzRwmdo/HIHoXq2MQCO15
	 TTvCXG1SjOsFfaUcu1C6H/0/LJbtT0tHbAJUNpFhIYCdrFziNLm0ENXe5ao/Zcdg/RF5r
	 ENf97Wf5P3gICTbb27ArA5ODMf3LrsHhlvnev+EuKGaXTG54AhpTtZW+hOlV3/z/YUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515539;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=vfv4q0//GszER/ZnpatsxtYNRtVSogmhUjUu6NcShzY=;
	b=C6cajYk4DQ/wo3079oUAC0KzxtPuTn/Q9bY5G14W5t2LBT1z1s/TvVuY1ereupWR301X
	 a+MicEwRQIZh1y/kFet16k9R3SGILkmD8bpBMg3YTW6GjIfIfWQBIwxCkvm2Ss/nVywxk
	 5Z6tVaNxhFUuMayCX8xFrVLmUStnH2HBNX1P3lUp1xJWKr9stjDx/Okk8LHRcr09Waq6d
	 YdHAjeDeIqtsdYkPYqIyZxM9lMVqIsA5waPVKdOU3LcXg2Ngjf8VRLgshfViCT7q29y5v
	 xmncyDNn95M3XJlEE50t8ayBq0TCOwluJd4/OwPpyEkVOyZTHchAWWWzbNbjbjL4uDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=bW5WUsXI;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C50D606A326
	for <ipsec@lists.linux.dev>; Tue, 24 Nov 2026 10:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C50D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=bW5WUsXI
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 2AAE520704;
	Tue, 24 Nov 2026 11:18:56 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMbiIDYVN85C; Tue, 24 Nov 2026 11:18:55 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 841A6201E5;
	Tue, 24 Nov 2026 11:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 841A6201E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795515535;
	bh=vfv4q0//GszER/ZnpatsxtYNRtVSogmhUjUu6NcShzY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=bW5WUsXIadFR9+sYne1FwD6UIG7UhVv2WK8vEFzgoNZKrRKQz/Trgy4tsk08bfn6Q
	 XPx9IQbJ2PA8jZvquxqfv6Al3TS+BDKoWPlGjz/9VMqzCYtSZOsGvQatutAANeK9QP
	 diAx9C/+8EM+o/Ce+eAcHHRoNmDjTSTSlaxOPB5mCw8pXXjKAWQzIz7gYeJzHLYiic
	 JFbTTy5007q8U6TUYRjHJ1ytxjFudsY1Qg9LIStCI7QDmozFBLg2iUiovzyIf1Mnhw
	 C1uEBdOYvNmvTVf3jatJJQtnTUpNxCdkLFBA92eFRVBVSvgaecCVEQjPLUxULDfJen
	 7m/3M5Qy4UMuw==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 24 Nov
 2026 11:18:53 +0100
Received: (nullmailer pid 3475634 invoked by uid 1000);
	Tue, 24 Nov 2026 10:18:52 -0000
Date: Tue, 24 Nov 2026 11:18:52 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Sabrina Dubroca <sd@queasysnail.net>
CC: Kyuwon Cho <kyuwoncho18@gmail.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Florian Westphal
	<fw@strlen.de>, Hui Peng <benquike@gmail.com>, <netdev@vger.kernel.org>,
	<ipsec@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH ipsec] xfrm: allow route optimization mode only for
 DSTOPTS and ROUTING states
Message-ID: <awVkjNfRV9ywdmGH@gauss4>
References: <179550330841.535592.4607028415857424638@gmail.com>
 <awVjQipfDmyOZZtw@krikkit>
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <awVjQipfDmyOZZtw@krikkit>
X-ClientProxiedBy: EXCH-03.secunet.de (10.32.0.183) To EXCH-01.secunet.de
 (10.32.0.171)

On Tue, Nov 24, 2026 at 11:13:22AM +0100, Sabrina Dubroca wrote:
> 2026-11-24, 16:08:56 +0900, Kyuwon Cho wrote:
> > verify_newsa_info() accepts XFRM_MODE_ROUTEOPTIMIZATION with any
> > protocol. esp6_init_state() treats a mode it does not know as
> > transport, so an ESP state in that mode is created, and the first
> 
> nit: I'd say it doesn't really "treat" it as transport, it accepts
> everything and doesn't adjust header_len.
> 
> > packet through it hits the WARN_ON_ONCE()s in xfrm_state_mtu() and
> > xfrm_inner_mode_input(), which assume that route optimization never
> > comes with ESP:
> 
> Looking at the list of available modes (include/uapi/linux/xfrm.h),
> what about XFRM_MODE_IN_TRIGGER?
> 
> >   WARNING: net/xfrm/xfrm_state.c:3264 at xfrm_state_mtu+0x239/0x3d0
> >   RIP: 0010:xfrm_state_mtu (net/xfrm/xfrm_state.c:3264)
> >   Call Trace:
> >    <TASK>
> >    xfrm_bundle_create (net/xfrm/xfrm_policy.c:3992 net/xfrm/xfrm_policy.c:2785)
> >    xfrm_resolve_and_create_bundle (net/xfrm/xfrm_policy.c:2885)
> >    xfrm_lookup_with_ifid (net/xfrm/xfrm_policy.c:3114 net/xfrm/xfrm_policy.c:3245)
> >    xfrm_lookup_route (net/xfrm/xfrm_policy.c:3344 net/xfrm/xfrm_policy.c:3355)
> >    ip6_dst_lookup_flow (net/ipv6/ip6_output.c:1299)
> >    udpv6_sendmsg (net/ipv6/udp.c:1699)
> > 
> >   WARNING: net/xfrm/xfrm_input.c:449 at xfrm_input+0x2176/0x5f50
> >   RIP: 0010:xfrm_input (net/xfrm/xfrm_input.c:449 net/xfrm/xfrm_input.c:705)
> >   Call Trace:
> >    <IRQ>
> >    xfrm6_esp_rcv (net/ipv6/xfrm6_protocol.c:119)
> >    ip6_protocol_deliver_rcu (net/ipv6/ip6_input.c:479)
> > 
> > Accept the mode only for the Mobile IPv6 protocols, as IP-TFS mode is
> > already limited to ESP.
> 
> This is reasonable, but I think we should instead (or maybe "also")
> add mode filtering to each ->init_state.

I suggested to do it this way, but we also can do it on both sides.
