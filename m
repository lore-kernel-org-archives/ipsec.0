Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606968;
	b=3QS459dGekep17GTwRVGsAtk8OZuCEInfkZ6Evx1RQDw+gxa/Mg2W4QeYwXxiuJ8TH3o
	 S8cPLrsH0UDwkiYii7kpZyQ/MBs9RMff36jIft4DruRQAZXnDp6u4fH+BCjrWB3qapFAL
	 Qrl4hgPbTRTF9SEe/C1ivcsQePrIOEv47QKWsRwi9A5YH4mndJe/DEi9+fFU68j0YBjvy
	 XguiY+yt4Kf5OcP6j13Osp0PMxNWB9uEqYLRhuy8WFUzn4yun5PC243uivZ1Bo8FlYtrP
	 obVb2J/b9neU/Bxp5WJPcQe0LuSL9c49uSuGKZf31i46zxnepWBXZ5oI8CfwP78U6mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606968;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=4cP//6uftNlbZ1CgEpvxccI/1eFx75zu58+1g01Ccl8=;
	b=t5CrQJJOje+2HLvOjIeAkQ3C7lcuzw5oMTAqEfEkKTmVoIl2x4KrbG+un+QMWsY3gfjA
	 5dXeZVX3FEUluUouLPKeUHzEagc5lIj0EAzwj/EsVqXU85Mhac2TN3IT6DEsbHQB378CB
	 g6OWxN7FU8bHkycU7X4smYP0uBkc6Kj8MxojfjZqlVJ99VUJz3lb6fT8E85ozO9xcdM/Z
	 n4GCW5q1gEbGULkSEIrjC6ZV3b5LEeL6Z7ZG+5rpQNho1T925WMSkqiE7PjzZdVselxQ7
	 6Cw6P9TsDpZWkyEdX2apLY4hD/aHodSnSCWq2/HgSbinn7/HqK2ERkGrAyxrpOJLYJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=queasysnail.net;
	spf=pass smtp.mailfrom=queasysnail.net;
	dkim=pass header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=XFmGg0K3;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RehI1OjG;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F5606A329
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 11:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D1F5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=XFmGg0K3;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RehI1OjG
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A764B7A052F
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 06:42:46 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 25 Nov 2026 06:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1795606966; x=1795693366; bh=4cP//6uftNlbZ1CgEpvxccI/1eFx75zu
	58+1g01Ccl8=; b=XFmGg0K3c2VNV/U1Wox9EqkGfkfqfapXdq8CPsXtSMnKCYiP
	r+Snf/QLovy355e075IwUtqz7rWJA9HcaStuyGlGfV+CXS+LDVf81zDmBroTG3+i
	2PR2wUtAF9QWmaWyBOm778lpl5Yo/kF9UtUCs/So+ynkiyZvD/2ublk4LMC+3ucI
	ppLMm1MN5aqQscihgo+R+WEkzm2YsAOqcvPta3Fw4/q5BUoVGX7M5WhsUUUXBhH3
	lyYQdlbMCvILf/flT1/MMj8/N6HPazgxO3lPnLCmcBgfm5v9levA/SPcD9LdSdr7
	MgRTTDEalmxA3tGdptgpbwQ7KVN6Qbm3Z9tU+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795606966; x=
	1795693366; bh=4cP//6uftNlbZ1CgEpvxccI/1eFx75zu58+1g01Ccl8=; b=R
	ehI1OjGYrKONm13BNoY4sHVLIvfGN75XZLB2+c2LxfZesbT8vk1eNtuXk1wId1An
	9w5UWMLr09Q6BeUrtRATFGEER7qAm3Sru78BP/oUQY+TgJ41O5VkZhVTo5pwAkOv
	3F1h9ImWZ+ppMjY9RwadxZU5Mrs4838SZc3n2vnrehgTrhMmvlgSTfhgIdEEN+9T
	XqlJ3DVhZoG5KbBFN8MzTrRGaZ97x89MINFNEXSuhZLAKIQS094C09RN8F5uRnoz
	fCqzQxsPpmSeVFVrVju/a2mn0VyA1OZORiav4EnShTP00LhrBKmG9L8C/WKQn/9a
	ZbJbPuwvu1mbCokciVYZA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795606966; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PGlwc2VjQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm1:rsa-sha256:NdBZWpxSGbz9oW/KwLKcuaJDaJdjQo42L8Wj3WwW92ciUsc
	09K/D2KF45VVVQpYdAIWc2Z8YZv18W3dfOGgkUgdE4vysQWEboOCAeM/ScheD71c
	9CxJ77wx1CZxgE5t8zTS9Kyjt3bVEJ8JGkEZXM55ojRSCrfTon1vRDsPVhG3Y69l
	42/TuIdVr5eopHku0Bk8H8dQ8+dr9VcD8Kxgv69UU3zVS371rRroKAWhmmijHBoy
	QDV3X/XAZ3ahfqoxBf/OtJDWyI5KfFR3p8AVOAf61JDbcYWm4LhdCEhVKgAUIvp8
	TQQK4YRqLiGkmz3aBpRW2uXDduEPDN1M7FGAe2w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:k7wUJ/1Z+GKcK+at9dE5gsh1z0yS4VAK/37wnpsRGzo=:VS2rSnb1gHOVw3QOsm75qp57SK5lJhkejn/bhUZ9EAw=;
X-ME-Sender: <xms:tckGa_v03hqb9em0vFiJzy6skLVhal7bBa674DZ9_MTbcuP8doZeHA>
    <xme:tckGa4rh3QQp0WLB-1H7OcgQIGt-Mz43zyGH-wlgVaWH9XXdIbWJvlPmxuDRpqhc_
    hP8g_wktaa6trjUmbQoB7Fk1LGBydf3K0cyS7-HHXJpAKZCVP19n0fY>
X-ME-Received: <xmr:tckGa-XFzYuM6OkJgq4VCmKqYx3IGfdhDbpP1va9a7Y2haGUl-lAtfZli1Y>
X-ME-Proxy-Cause: dmFkZTFS2vUXDjXD2CzX40LTsRscSpS1p1yBuargzSROeWa2OorAOwjnVxQCSz/bap8/DR
    uyDQZa+BfdH5cozSOtE70/1DWRl9qaR3PU6/eH7o+053A5UOVU+VXNUwC1XjYSZKkfrTMG
    tDDZiSZ6XHqIhlB0Bs79nMAWPd89kpkpqfg8DWkT0jdA9QFcHVxHO6zJQiP0cj2UxqO4Fg
    27Gt6LuVK23jTbORvZjt/71VIZlXlHDqn4qWwd4ESFPi5NC4eqflwtvLbU1OOTWz1XxyNZ
    w99DiYKbLbNEKu+WxigTaRF9j7Gyy8C8F6gxpZOB98j9amIqYrAONCSYf9Z4Ioj1fSwPnS
    GuOgsldt5Uo3sRK76ANpNxjjv21Ut9l6Vz6PYrqV+rE0lgjoGRVF2GhwaKm999Zx+o6E1p
    u2+1+I8T/lIL9lNlkAoK4kQKiZrSpNn/m/O6arCk4Jih3IyvmHxnqLpS/kGP08yk6taoWG
    sY/l2bebyHF13J2Osw64QXKvsiceSGytVb9OGtd5BTgdLo7+sT3W+IHTJEa5699xjCnfhF
    JSF+nfmr34yUVq8GGEs39VKfoDFkcTx7bBTLEvUWB72bZxa8hFuL9RCawNUQd33pKdmEyq
    jxzLLAdZz5qaGGIvDkVttI0YZlU5KrLQLAqNLFuhICQBcBWRUCKC7GKhIIIA
X-ME-Proxy: <xmx:tckGa42G_c2muUtHYSM4_swTe9X5AwMIVQjP7UlMl_WXT-94V1hrDQ>
    <xmx:tckGa7s7H8N8u16YO2wkaaHPo5PuU8YO41YIrtwj9CQIqHPTkVqKVA>
    <xmx:tckGa4VDP1VBELKXvllV83x4eybttoxxxiOh_EqpItuJznujzv2EEg>
    <xmx:tckGa7xYAIdT8E1NH-F6vvUj417MeroC7vjPUbG-2CEwu6p_B0eRzA>
    <xmx:tskGaw6WbbPGyFdC8hBn-1EkRwY0PFekDyvxmRaSLMQn0BMiWseUpe2l>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 06:42:45 -0500 (EST)
Date: Wed, 25 Nov 2026 12:42:43 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: zihan xi <zihanx@nebusec.ai>
Cc: netdev@vger.kernel.org, ipsec@lists.linux.dev,
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	horms@kernel.org, vega@nebusec.ai
Subject: Re: [PATCH net 0/1] xfrm: espintcp: fix IPv4/IPv6 receive path
 confusion
Message-ID: <awbJs5YyFCHkggs1@krikkit>
References: <20261116155229.318582-1-zihanx@nebusec.ai>
 <awa-F8TtQllwfELK@krikkit>
 <CAANe3eQhQD=6s-Da74_bEy8qNFtOp_kCqpqDs64TBv0CAXdKtA@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAANe3eQhQD=6s-Da74_bEy8qNFtOp_kCqpqDs64TBv0CAXdKtA@mail.gmail.com>

2026-11-25, 19:14:18 +0800, zihan xi wrote:
> Hi Sabrina,
> 
> Thanks for the review. Your questions are fair, and I agree that my
> original cover letter did not distinguish setup evidence from evidence
> of impact clearly enough.
> 
> On Wed, Nov 25, 2026 at 6:53 PM Sabrina Dubroca <sd@queasysnail.net> wrote:
> >
> > Hello,
> >
> > 2026-11-16, 15:52:28 +0000, Zihan Xi wrote:
> > > Historical QEMU run output:
> >
> > I'm not sure what "historical" means here. Your reproducer will output
> > the same thing before/after the patch.
> 
> By "historical" I meant that this output came from an earlier QEMU
> run, not from a fresh run for this revision. The socket output only
> confirms the test setup: the accepted socket is AF_INET6 and the peer
> is v4-mapped. It does not demonstrate a failure.
> 
> The relevant observation is the ftrace entry:
> 
> xfrm6_rcv_encap <- espintcp_rcv

Yeah, thanks.

> It shows that the packet was dispatched to the IPv6 XFRM receive path,
> despite originating from a v4-mapped connection.
> >
> > >     accepted socket domain=10
> > >     peer=::ffff:127.0.0.1 port=41512
> > >     recv=0 errno=0
> > >
> > > The historical tracing additionally showed:
> > >
> > >     xfrm6_rcv_encap <-espintcp_rcv
> > >
> > > and XfrmInNoStates increased by one (before=1004 after=1005 delta=1). The run
> >
> > Which is expected either way since you haven't configured any xfrm states.
> 
> Agreed. The XfrmInNoStates increment is expected without an inbound
> XFRM state and is not evidence of impact. I will not present it as
> such.
> >
> > > followed the no-state/error path without a KASAN report, oops, or crash-log,
> > > so no crash-log is attached.
> >
> > So this is just a "regular" bug where things don't work as expected,
> > right? No other issue after we pass the packet up? (still worth
> > fixing of course, the patch looks ok)
> >
> > Earlier you say "the vulnerable path", and call the reproducer a PoC,
> > I want to be clear on the problem ("vulnerable" and "PoC" sound like a
> > security issue).
> 
> I agree that describing this as a "vulnerable path" and calling the
> reproducer a "PoC" was misleading given the evidence. I will use more
> precise terminology in future revisions.

This will be helpful, thanks.

> Based on the evidence currently available, yes: this is a receive-path
> correctness bug. The demonstrated issue is that ESP-in-TCP dispatches
> an IPv4 skb from a v4-mapped connection to xfrm6_rcv_encap(). I did
> not demonstrate a crash, KASAN report, memory disclosure, or a
> consequence after successful XFRM state processing, and I will avoid
> claiming those.
> 
> Separately, source analysis confirmed the control-block overlap
> addressed in the current reroll: strparser metadata overwrites part of
> the saved IP control block before the old code restores it. However, I
> have not demonstrated its end-to-end effect with a valid inbound
> SA/policy. I also could not substantiate the proposed kernel-memory
> overread through IPv6 ancillary data; the inspected helper
> bounds-checks reads against the skb tail.
> 
> I have revised the cover letter to distinguish these findings and
> limitations. The reproducer demonstrates the wrong-family dispatch; it
> does not demonstrate a crash or security impact.

I don't think you need to send a v2 (unless Steffen asks), I just
wanted to be clear on the type of problem this is.

Thanks.

-- 
Sabrina
