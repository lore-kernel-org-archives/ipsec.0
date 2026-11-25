Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604002;
	b=ghBqCC8KCGA6Y48lF7p86sEM/IAb9xfNROKmXVZWmwKx0upEReNmUTHbH+DsokgNx2wT
	 HdvD3UBqN33TpFGFR+ZIdH9vYO0x6A+aHGiYplGQZhfPqdSbmh2dRy70GD57MFstB3XLS
	 1JYHQxdwYF4+VH2ltOCzQo3PyIsUxyV4cOnNeeAupEdxRt7QYXRYthsKkWvnNVd5BqVEh
	 dJKC5+0j4Cey0F0UxrcOLeSvccrbPuIsCzGl5YdoSS7WXxqxYBDSde1AAVqRPdXz5QaRz
	 xUsdkTm4dGGwt5QBWFRSnrOyFNWmWYeNUWTIi6E1+ZCFHJ/NTHTO/IvgVDJ3p7QRIpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604002;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IMedBWjX3od9XnP02Tr+7kPdu9op0gEHiwtOGI7i/ss=;
	b=BGjNnnjEWQ0hS5hJDfZTOE6CUhVk1wM1BZTyiAbwzuolGsGrfLDMbeE1GE5HkIPIJpWQ
	 Xa2KkNqNCR2lepNOfTdLPdrdQm/QoN6t35a9stsKaHYXpCfIgNn2JtDs6B/xobY0FUfcA
	 j8cA+q7ixs0p4+9egFDGc7BjK7LXiJIQb0xL0mvjOCiG4eMPkBW6dyxZMgBugVppqrSwI
	 HAd2pMspLH5LgtGB/l+CH5a6LYkmaTMqA3UkUO3Xy0JcoMbEPuIzRXJ607Md2pfTGbmbz
	 asnU7ZE/67i6ZzeK7clQAWWZhzKhkiSX/w5kR88ksKCG4IfbWXbTSHKqRUsB0fv7l2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=queasysnail.net;
	spf=pass smtp.mailfrom=queasysnail.net;
	dkim=pass header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=bQ8C3qxP;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gyXbDEpP;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFCB606A323
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 10:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFCB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=bQ8C3qxP;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gyXbDEpP
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 237D31D005C4
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 05:53:16 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 25 Nov 2026 05:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1795603995; x=
	1795690395; bh=IMedBWjX3od9XnP02Tr+7kPdu9op0gEHiwtOGI7i/ss=; b=b
	Q8C3qxP+9d2HMPK8mgfPgGMznQxX5oCbAIvogC599Wia7S9Lbs++V83MNLgA55H5
	9Ho0iU495/ED8Svl+Cbo7wH+vRwfzFtFSewYseyiAp+1Gc3YyLQQ36L6OkWHCnT8
	eADy50dtq0THvDEuPvGrKUzzDcDjxepIhnc0yKQOtbbythfviY7phuRrqww/GgVe
	MHXpkrFdqcxneej0ovK+l+5kbNSg0btTwSg7wnLX9NXtKdUV9gQO90tjasn58E30
	EDQWZkWunB0vZOvkpPzUwJZkW0s8fzvBrwn9D5Cy86na9AMXh9hTBSf66tO0Qjg7
	G9mUlFQXOUuhrxHTtLOIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795603995; x=1795690395; bh=IMedBWjX3od9XnP02Tr+7kPdu9op0gEHiwt
	OGI7i/ss=; b=gyXbDEpPwsCpKuvySIRatM2OcD5rtgJBpaaYc5C/D6k2iWMDFdX
	bF/LMNPGUnWIQ78hHhTTGC575Oa2jtO65l1z414RK9wQ/miAm4drlkIubz58nKac
	TnkSO+hE0UIc6SXD567zje3pyZOWXT0dqik4EWb3vUaTFQom/jeGxMozmduYRMto
	ft7nvIxGnqcXjD/dLAkMZ6C7SBK/xzEsge+L3Xs2fBeUU9x/ABW/PPOFjAk+3nhO
	k6UAsXQMw1yLwxv9N051tQJclus89eUrxVeAtQDpsLC+kIxv1kcE74ppJkSfCnli
	As0iaicLLu3GPT63fmWMNnrD/+7j2M8GWvw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795603995; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PGlwc2VjQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm1:rsa-sha256:jEtLIyoVGmnsMaT6QOLdRYhgdskPYvLsxqQdJaZDYhqCkX6
	X8sSpYiwpTAVI6ozOC5cC4MiU3oObZHL5Rhem0Lly5dcgv3IEcJNZmE3hmwf0XdU
	4i2vzfyOMEN7ntD5wlWb0Azw7TeVlDh3nBXQWR+UXDjXbMruFOVIhF9KK7mETjON
	+elDBxZjofQ3g4NADjmT+t6Ig4anh2TAMZ3sdQWYJK1cYGaCMyKEl3idkISwzuNC
	wPF1hnNNjwHGwYt0S8LNIAnhtErMLk/ao38GnlzxeTScMYY3wcXNlxVaSRC9KpVk
	OA/rEh3/gM2u56r0yxOZKZHD5c5qHyDc36rcyow==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GaYmS27SHISQh0lT//rasAORSoR+j9znckb4ncjj5FI=:RAlWs96h1djoT4wp8bSIipVCnv+/8fOAkojvTVQS1E4=;
X-ME-Sender: <xms:Gr4GaxuOQ-HRFy2F-ns_PZ0_4t7aSBNYPvpOIabcf10UDF0Mq-G5yA>
    <xme:Gr4GayrUxcjnhW2cLd4rQXoYFIts89F4lFz3Y6udMa9Ov_ZG3XAqXhEmXIsKwjIWr
    fTdY8KOsS0_HuZOIFZM0GXJyv8ryFhb6noEjldU3_ZR5wTWp0yGnrg>
X-ME-Received: <xmr:Gr4GawXUC8VxCCtnjXk5GhfbL0wlDPHiEuEdfgT82hrX02lR-DljXzcMBcE>
X-ME-Proxy-Cause: dmFkZTFL/iCFQ0PAibj91uAXUdDjtMpu/z4F9HtlVgjv9YoagyQvMuaPr/PMKZ6cT/Ogmw
    FX/1GzlQ5XIm5eAUY6sqED9iYpsKMCkjEFQ2dp8ARYw0SbnTFtzajNMBepCuvtDPWQEH7B
    7sVGAZU8S5Epr4pisGez9MEW3KYmnc0MPnB7vNYOWekwmPmiMEnIo83fti/cb14Mzd8Uuh
    MQRTm6diJ44l/mjevm2Y2Vo5rQIM41U5beUnSUnKbW0WMJclbas/BHGYlVU5nBIQydIeGp
    u3POhF5jqTBRAsnbnC0tbaq0faIuZJ8pFwiEYiSHrnrBqF76pL2BcQfoAzg91pkcjBpaeT
    jgdvgvh+dvr9O+GxVWJNpnEhknPu08gTp/JkqNr7yaugcdHWnuxxxiy6IVwNaJiiFzkIZh
    J1j4qHNz+9gXJ6js7PMqrZZ2Kv786EV/vJ/SWRZOn69uLcR21Abf13DYptqph0wt3Chq0c
    8vt+jm0NWak6btcvJaK75l7yjUsLtZaDYDy8uh0rOycOiW4F7RZMe+2pFh3I3lNI5kNCKz
    MDdrBwzOrOb+R+YpBwTNOKGJAC6L1RAQ7mJL+5KZNbo7Nm81E0Jv+b+8pDs9tK5Q6NOf5M
    aCxJ7wjHoG4TN6BS87vRyK6gNG+vJjDUa0eYduxvl0VwFwFGRUEy6sjzfWzA
X-ME-Proxy: <xmx:Gr4Gay1KmrP2WHM6O-a_HPY3VExfySEPV7SpiPkSWdoeNyW0H_0ZqA>
    <xmx:Gr4Ga9tGIHZj0SA36yup24Kllvsh6ddjEIVOC8tDVOlvewxzoLH4_A>
    <xmx:Gr4GayXAL37-QNKXzkeUfd23YEWJi8g5UzcAygDedwQCr8jOIZOpFw>
    <xmx:Gr4Ga9wo3ajUsxgkIpQJGfsKWdd_u3mY256zuH8HprCVhqlrhNNweA>
    <xmx:G74Gay7RUnoYmVZLxUa7kN_3YB5IRHwUDyiFEgpOafGp2XnQjko1zJdP>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 05:53:13 -0500 (EST)
Date: Wed, 25 Nov 2026 11:53:11 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Zihan Xi <zihanx@nebusec.ai>
Cc: netdev@vger.kernel.org, ipsec@lists.linux.dev,
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	horms@kernel.org, vega@nebusec.ai
Subject: Re: [PATCH net 0/1] xfrm: espintcp: fix IPv4/IPv6 receive path
 confusion
Message-ID: <awa-F8TtQllwfELK@krikkit>
References: <20261116155229.318582-1-zihanx@nebusec.ai>
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
In-Reply-To: <20261116155229.318582-1-zihanx@nebusec.ai>

Hello,

2026-11-16, 15:52:28 +0000, Zihan Xi wrote:
> Historical QEMU run output:

I'm not sure what "historical" means here. Your reproducer will output
the same thing before/after the patch.

>     accepted socket domain=10
>     peer=::ffff:127.0.0.1 port=41512
>     recv=0 errno=0
> 
> The historical tracing additionally showed:
> 
>     xfrm6_rcv_encap <-espintcp_rcv
> 
> and XfrmInNoStates increased by one (before=1004 after=1005 delta=1). The run

Which is expected either way since you haven't configured any xfrm states.

> followed the no-state/error path without a KASAN report, oops, or crash-log,
> so no crash-log is attached.

So this is just a "regular" bug where things don't work as expected,
right? No other issue after we pass the packet up? (still worth
fixing of course, the patch looks ok)

Earlier you say "the vulnerable path", and call the reproducer a PoC,
I want to be clear on the problem ("vulnerable" and "PoC" sound like a
security issue).

> We run the PoC in a 2 vCPU, 2 GB RAM x86 QEMU environment.

-- 
Sabrina
