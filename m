Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628413;
	b=FNu5Hemrj57KwSqhG0/Bzwntj18Pya+VxOouZLJB6EP9/9QSOhqwSCexBM+Q4JMZAw1h
	 HLlpdR79vFGswlbjy728V/xpF6s7DuQFPo/r/AgIHkIgnnMJsDGC4ax/MuU7NGQXJbDxE
	 FSjDxyjLWuOrrJLQidmrPCJ5K0rZdOj77RMU7+106Td2SnwhmI7dGuH+VpBMlEjNdKeCX
	 tQk8yq5t2z3NSG4ka6os0C5y/SxAFdNxSqeBI3tHrjELx4Gi4gJx3chMk9RCUsfqNMYwc
	 5e8SiaH9l/yL22+PBIqs8qrweF61LC8DdXCm5JUNs9nId1NIMCdkItxHnzwI9CKriIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628413;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HoQUopBi51dF73r3Zj1/3djqaVpT5av8FoAZ7EzGDzY=;
	b=4lwBI+GDg4MLFJHE6n1NzKAC+8N8TQfRbz0JKdwbIh/kHEo91+hYxXXZOZMTWF1Eyy7L
	 KgRB1ZeFh6kKKPa3hUyk1rHUPP5xPkgHnh7845svjrH4c3It0N1eMQluVrbcGNrPNW9YJ
	 lLgDfICLX/BZ9CvreMOqAvH72AkGj0ayCeZLovWTVgJMaJmlmCUEdXcimgKlJTRInvoSM
	 XRHsOwcL7WNOyu0YSNnyECkHxtlJWC5P74jQXkcBxIxeVtNL488FZHdBas0Z+a0tn9P0G
	 /sUhnRsb8hYQ+MqY5DudXQoI1ROS8kGiAan56M4r/Y+Ou803X4ghVI/q7yNVkUwkd9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=queasysnail.net;
	spf=pass smtp.mailfrom=queasysnail.net;
	dkim=pass header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b="OFU/xVB5";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kDO+O3iy;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3E0606A327
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 17:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF3E0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=OFU/xVB5;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kDO+O3iy
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 2F53D1D005AA
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 12:40:12 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 25 Nov 2026 12:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1795628411; x=
	1795714811; bh=HoQUopBi51dF73r3Zj1/3djqaVpT5av8FoAZ7EzGDzY=; b=O
	FU/xVB5oYWl2tsCLuNfzIiTgwr27uXblPTa+7rrcPVNeCip76etvj7QAIwSWKcvT
	PMJdlRKEqamCBD1hesKMf3NEcSmySm5gEU+7WotZJHNDd7xjoX2ARtvD6gBwWeit
	ANeZxXYtwjZkCJCH6TBa87CyOyit4TcSe9WKlg2EQUzGeHh0TAQ0n+KyOGOTZeXD
	9PxF7AaBESUAcNSHyS0BEeRIVYTny2IEjKCqIKEX3jx1J5mqATNIGINXUZfSYsyE
	s8NIpLK2dIDUvIwaGS/JQgYFWAJ1qAB9GwrrhItJbS4hO5C2ZWg6f5yfkfY8oZNz
	aSPy3iNVMQsKd/tMCY6aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795628411; x=1795714811; bh=HoQUopBi51dF73r3Zj1/3djqaVpT5av8FoA
	Z7EzGDzY=; b=kDO+O3iycVG06I5IWKoAEFypDQyZNtPv2AkvT/nMcSp/LRmphw5
	Z8UTPg97rgla+GPyY32B2Gc3GH/TfPoocGJS3Zq3UhP3F7heOrReNK+gJU8TmJMr
	ySiJSB2Sg3SHDHW1ZYhw2x2MLfJ+868d7GfChmWc2f8YeTW7Tokn4RIRHmCNCmHx
	A88qMSIVfd/DGIl4XBsTliriljb8z9JEgGA29dlrX83f4HrLSugO+AN9oMXP+QiM
	Lw1sOnFavfX75upxpLZBXjHdxKyEMR3mOTXkryYlJC/n9lRLBpqk6c2QzogCuBX9
	oB9rbIxyOT1ydJZY9/WyrOwmJH5651VUYqA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795628411; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PGlwc2VjQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm1:rsa-sha256:h0FTnnNn5O7geDbjtdph2/feLqoJs22ayyWH28b7k59ExT1
	JJOKc//PmLxuFFHEpvWqLIYDGIuQM5PgfPWtqNfZhqvdUJg5g1yBF/F5uLswzpk9
	HS6jkV/sNwTqWoquku06jF6df7GARMGKl9nUSj0KZUB3y/CgNq5UoTCYNGKqqHl7
	0MJ5iRZRv4PRjrhdr281mSFEp5RTdslODa1PI6AeEZOJA+RziZGHF3YIN/pIZhVC
	xGIsjPNtqaYDhjN+HW8CNYD0mNj5oCESds+X1YDkdvioWw1pkx/iPsytz5LX4ypE
	VYssjfbfE5l2iB5vIxUttVvHB+R8JJ/bCAZzuFQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:nlB6kU06KBpjR7oTIp8lD3RAB7CYydGUzsyPfG6enjI=:MLqJi7BkavG3iL1513AuRBtfDKRr27qAm2+leZMVcKo=;
X-ME-Sender: <xms:eh0Ha7np3sZHY0tlzbuxdBh14WgESHoZDCx34ndr41ybSGAa77PMAQ>
    <xme:eh0Ha3DK45llMAFSa5Q27mqnaqkJZUrjidKQzFNXg8kpW2WzrOQmZVjh7B9rK_UWc
    M-rmWyaFE27letYJtBbp3Y9HSU3D9bIp06f1azg1gHWx_NjpG7hzSab>
X-ME-Received: <xmr:eh0Ha9OTmHZkYVZQ9XhYgMk6Mt4FO0lwm13w3dxvg2FqBhdx2HwU_I7w7vA>
X-ME-Proxy-Cause: dmFkZTEs+SHHSfdrN5LoarBNU6r6WXUYqJLC8YB/Avm+3cckz5o2duYyWoJs/kimcjNA8e
    He7LPQYCQIbsBgV4QII62YaQhZYccdNuSXIsp3RoCPIr0OWT/SN4EUMqCmUGXK/pjUQdLd
    jgzLmFYn3c+gLHjIXW0Vs+lbRGkKGNxLni4EZCYgFVAELj0iam3eyIKZxf41P6W6elQolx
    FpRrnH6sahj3tp5E1umBIEryjmo9DeDggeBYkD7MT9DzMKLTJ/7oIN+VbIjGSCAusDB5qg
    Ln/aUWttelh6J0tm4/Y0RZYx3+H8EokQc+zXP1djPwB0OgrwCYCWptNBYEAF94Q2+bc/Zp
    WIZO60XU14IOZFzoEEDISKnlQcM1JZiu8j/VLcKkqZuHFIbWOn8KUIRMzHotKrwy2VTP5j
    MfHX+m81P0hGAUytPAOhyUUlPvNcWhLpYoyr0KPFNTG7SC19BF6rGIvGg1VLDdJNXZsolk
    ip1nbmiyCbYIOYZYhKrHMVLjN2d0mpV4knRrw9xQLvv/oLWet+41aSdGgdRtZGvBlAUIvs
    HVjesM2brfYLBUtiuLcsWaKOYL0587ahpGDUAqbeVsWaFoLoHzRwoj0PHbT54+9QVLmQQ4
    oodDDLauMn2jbvQoIHh5+Girj3ZqCw12YGauv7RDdt5yxLRVZGXPhST3qbNQ
X-ME-Proxy: <xmx:eh0Ha-MIwzYKgVZA9w0MDV6-kE_N9uBHXiV5pdrw5ZcNOC66_RQQHA>
    <xmx:eh0Ha1n-mI2o3tBoCGlRdcZdYL1UxWWro1PxljobQYF2IZZiSpbwEg>
    <xmx:eh0Ha8sUmV3_swFVz_socTbeuH9UPGUx-9CteJRov5mg91zalfpYJg>
    <xmx:eh0Ha4pXy2fhmaqCqLW2HO8y5i_ZhbXKEqiOEPOPOZbZjZZo9TTKEw>
    <xmx:ex0Ha6zNWAKLrle0ZDIZqfWC-FTeCXEiuodCN4GvUazz3avHsntpn09D>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 12:40:09 -0500 (EST)
Date: Wed, 25 Nov 2026 18:40:08 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Zihan Xi <zihanx@nebusec.ai>
Cc: netdev@vger.kernel.org, ipsec@lists.linux.dev,
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	horms@kernel.org, vega@nebusec.ai
Subject: Re: [PATCH net 1/1] xfrm: espintcp: select receive path by skb
 protocol
Message-ID: <awcdeKGkqFt-uZSy@krikkit>
References: <20261116155229.318582-1-zihanx@nebusec.ai>
 <20261116155229.318582-2-zihanx@nebusec.ai>
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
In-Reply-To: <20261116155229.318582-2-zihanx@nebusec.ai>

2026-11-16, 15:52:29 +0000, Zihan Xi wrote:
> An IPv6 socket can accept an IPv4 connection through a v4-mapped
> address. Such a socket still receives IPv4 skbs, but espintcp selected
> the XFRM receive path from the socket family.
> 
> Use the skb protocol when selecting the receive path so IPv4 packets are
> not passed to the IPv6 XFRM parser.
> 
> Fixes: 26333c37fc28 ("xfrm: add IPv6 support for espintcp")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
> ---
>  net/xfrm/espintcp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>

-- 
Sabrina
