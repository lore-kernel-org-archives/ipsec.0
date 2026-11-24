Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501077;
	b=uJXQbYCaXyPW0/nWTg6i2k7D5RdYyJh8wX7/MZJoAFL8jtkpkM84MnBfm7zlbaDlj54M
	 wrlnqq0oYlcpUp0PSeWeQkwzx33swgKHf9A6K1T3/1Xl/RliCAcBYJyS+/lDseCATnfRq
	 0KHsAivbvxXVn7jrIChhY2luMQbpoQ5FYl+rG7BgtkdbNbfpSGJNCCU4gW8MHa7Ux2oy0
	 iVWCf8G58Sx2iZCZO722SZsEqQYKZMJZ+bGLDRb+b5vjw4ZmX7Y2aHVE8H/clsjXhEVOh
	 O9QgtK9EzLWXe55G3vf7OfsdMtwivbAYoFbghGzWiLwsDRAKmSPfn7o5HOUueSJfe3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501077;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=Fns5KSeLA1lAqdtuoDUdCMp8WJ8wrSCmXQUe1et8xFI=;
	b=PiFuynRx+eQtTJpKvdHzF08qMAy/Pz9Fk80uKHD7ll0MUAYaqYKQpKNaDSvNRWX5gv4G
	 HdoClS1s3yxlyKziOSwyOCZEWKWO/JjnqCy3L0RPKbjx6abaiCCtkrbWhGxJYr3xulKeL
	 9UMOIaZCPv7yjeXusZ3ErMcU3egDQvr4Apn0/E7vh7wjk4Opyx1bDeOO56spUQDUtq5y2
	 rqQvYLGGiuf51VWXmqzdEebicj3YeQMUA9UA2IKTOphylW4Js4b6yEcVy7dDGXAJyP5sC
	 7sP4SP9RQqgJdyBbxwNTszYdaM8A0X5J3LK7UGJum59r+U5MMbWPtaFM10bi+zqQK8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=CuMNmgBk;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34199606A31E
	for <ipsec@lists.linux.dev>; Tue, 24 Nov 2026 06:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34199606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=CuMNmgBk
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id F0989206D0;
	Tue, 24 Nov 2026 07:17:53 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72SRn53h-tJp; Tue, 24 Nov 2026 07:17:53 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 580BD201C7;
	Tue, 24 Nov 2026 07:17:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 580BD201C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795501073;
	bh=Fns5KSeLA1lAqdtuoDUdCMp8WJ8wrSCmXQUe1et8xFI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=CuMNmgBkP7qTfM6MdxNUQ6ZyVyFsrN51hj1M1RaCrS/5jRfJkAFbqvLG2UzS3NtM/
	 Lcg5KAuLcfVffLvgrX+EcXiVUgPrMB6Oenm9MyxVshBWaox4J5C6JNKRglv9dctAQw
	 5XJ0IxPDsK3bZEa1qDH/MWmz5iQF78pJFMvPRjp6bhKCFczY1u3b4ZqDbBkBs36oj/
	 BPhB8a9Ix0gI/uXi8R6tdQuT0h5c/Jv99Q6w98eIRyNkIEnzvHc1E5Wk2hf08UOwYJ
	 yQjiFDbvwvAA225xSuKdx17rxcb50t8f3ugwLxr2wZh0t7xClgswJGTE+v3rjaB3ev
	 Bkv3vBs4jrdSA==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 24 Nov
 2026 07:17:51 +0100
Received: (nullmailer pid 3202217 invoked by uid 1000);
	Tue, 24 Nov 2026 06:17:52 -0000
Date: Tue, 24 Nov 2026 07:17:52 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, <netdev@vger.kernel.org>, <ipsec@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [BUG] xfrm: ESP SA in route optimization mode hits WARN_ON_ONCE
 in xfrm_state_mtu() and xfrm_input()
Message-ID: <awUsEE7XZIFwc0Ws@gauss4>
References: <179493154245.3969421.1349059390749040254@gmail.com>
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
In-Reply-To: <179493154245.3969421.1349059390749040254@gmail.com>
X-ClientProxiedBy: EXCH-02.secunet.de (10.32.0.172) To EXCH-01.secunet.de
 (10.32.0.171)

On Tue, Nov 17, 2026 at 08:05:46AM -0800, Kyuwon Cho wrote:
> Hi Steffen, Herbert,
> 
> While testing v7.4-rc3 with an LLM-guided test generator that we are
> developing as a research prototype, we found that XFRM_MSG_NEWSA accepts
> an ESP state with mode XFRM_MODE_ROUTEOPTIMIZATION, and that one packet
> through it hits two WARN_ON_ONCE()s. An unprivileged user can do this
> from its own user and network namespace. Sending the packet:
> 
>   WARNING: net/xfrm/xfrm_state.c:3264 at xfrm_state_mtu+0x239/0x3d0, CPU#1: test/107
>   CPU: 1 UID: 65534 PID: 107 Comm: test Not tainted 7.4.0-rc3 #1 PREEMPT(lazy) 
>   RIP: 0010:xfrm_state_mtu+0x239/0x3d0
>   Call Trace:
>    <TASK>
>    xfrm_bundle_create+0x1560/0x2340
>    xfrm_resolve_and_create_bundle+0x158/0x2d0
>    xfrm_lookup_with_ifid+0x483/0x18e0
>    xfrm_lookup_route+0x1e/0x180
>    ip6_dst_lookup_flow+0x196/0x1e0
>    udpv6_sendmsg+0x163b/0x2d70
>    __sys_sendto+0x2b1/0x3c0
>    __x64_sys_sendto+0xdb/0x1b0
>    do_syscall_64+0x116/0x630
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
>    </TASK>
> 
> and receiving it:
> 
>   WARNING: net/xfrm/xfrm_input.c:449 at xfrm_input+0x2176/0x5f50, CPU#1: test/107
>   CPU: 1 UID: 65534 PID: 107 Comm: test Tainted: G        W           7.4.0-rc3 #1 PREEMPT(lazy) 
>   RIP: 0010:xfrm_input+0x2176/0x5f50
>   Call Trace:
>    <IRQ>
>    xfrm6_esp_rcv+0x83/0x1c0
>    ip6_protocol_deliver_rcu+0xc71/0x13d0
>    ip6_input_finish+0x192/0x3f0
>    ip6_input+0xcb/0x220
>    __netif_receive_skb_one_core+0x114/0x1b0
>    process_backlog+0x3c6/0x12c0
>    __napi_poll.constprop.0+0x9c/0x5c0
>    net_rx_action+0x48e/0xe30
>    handle_softirqs+0x22d/0x980
>    do_softirq+0x43/0xa0
>    </IRQ>
> 
> verify_newsa_info() accepts XFRM_MODE_ROUTEOPTIMIZATION for any
> protocol; only IP-TFS is limited to ESP. esp6_init_state() treats every
> mode other than BEET and TUNNEL as transport:
> 
> 	switch (x->props.mode) {
> 	case XFRM_MODE_BEET:
> 		...
> 	default:
> 	case XFRM_MODE_TRANSPORT:
> 		break;
> 
> so the state is created. The ESP paths then reach code that assumes
> route optimization never comes with ESP. xfrm_state_mtu() has no case
> for it and falls to:
> 
> 	default:
> 		if (x->mode_cbs && x->mode_cbs->get_inner_mtu)
> 			return x->mode_cbs->get_inner_mtu(x, mtu);
> 
> 		WARN_ON_ONCE(1);
> 
> and xfrm_inner_mode_input() has
> 
> 	case XFRM_MODE_ROUTEOPTIMIZATION:
> 		WARN_ON_ONCE(1);
> 		break;
> 
> The packet is dropped on input, so the effect is the warnings, which
> panic a machine with panic_on_warn. Both WARN_ON_ONCE()s date from the
> 2019 xfrm mode cleanup (c2d305e51038, c7b37c769d2a).
> 
> Accepting XFRM_MODE_ROUTEOPTIMIZATION only for the Mobile IPv6 types
> (IPPROTO_ROUTING and IPPROTO_DSTOPTS) in verify_newsa_info(), as it
> already limits IP-TFS to ESP, or rejecting it in esp6_init_state()
> (route optimization exists only for IPv6 states), should avoid it. We
> have not tested either change.

I think adding a guard to verify_newsa_info() makes sense. Can you
submit a fix?

Thanks!

