Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514914;
	b=x70lfzLxvqeQ4WwdhoZkqXHfKtMPjbLYp4rafj5+ebzTEZU6KKrCFQMTv262XyLiB7xj
	 LMajC3cQ/YnOZNxjOhASY6+kPkfBWHGAT3CijjZ2NuXEZwYhLe4OminQXwcF8qy1TvD12
	 0bVs6eYj3p7GqfOyFXkKXaNk3hXloHgP6A3VLaJ3hNZcybJnLNqDtSR9BScVYrvRWQA+x
	 qWaac0P/m+WZPgGHU1qaCYKWrUC5095y3skV22o2eKDetGT0G/z9Aau2MODvM8xZ12qyb
	 +VqKo+/UrOjP74z2tgx5DOMsfoCgA2+tdG9jbYBG09unGVjSAhYIUD3rx94FMPV7cBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514914;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=bcZqlRNYWH5Ii2gko6iIHLFmdnmspwME+BV7jWvJSdg=;
	b=EV3gD3yCTTmratQAw/BpQ3lA8y8v49pXJJf6EJLAi6UD7wNApWDb7r92aSQ654QENi1o
	 MFBrkQmLFmNbraywZKV6dSy3q0LW5DAQ2IV7B9qdwIuyArSztBI5QjQ9o+OGp5zPXbnKL
	 fYDLT8pT9JyFzYUcCecDdKs1ZBNBts8KNI9ozGeMr9b6/XAIhkSuRyZoIPlagOkAa7M0k
	 gvtRN0BAtO/RngziIlaM4jTI8a3td+LO4TlpAR1J3x68h7GYSSnK7StoHHfKoIaIuitIR
	 grTss9LIgdz/vYFsRU8JGr1QOXXVm6NJSEuwyOOOC/89WtxeGmywQTJexUtv+hEr1Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QNjQRWeg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9b3Lh6If;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b1QYJpJN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rzOrrWHA;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE10606A684
	for <ipsec@lists.linux.dev>; Tue, 24 Nov 2026 10:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE10606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QNjQRWeg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9b3Lh6If;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b1QYJpJN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rzOrrWHA
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E651522023;
	Tue, 24 Nov 2026 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795514906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bcZqlRNYWH5Ii2gko6iIHLFmdnmspwME+BV7jWvJSdg=;
	b=QNjQRWegIq/3QTe/4ULZZbfked4CXt+6o6ie2FVZOd5Rtz/j0CoTRlvZDELpBvrbTifykT
	LnYNJvDzQ6mknt1YOQUyP22InNaYHo8AcEHFlbEeitdi5aH2Ejh5DchytR++xTGrwxQkkd
	B2YOHeKma2rM/GzVKt0XYb5En4/2JBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795514906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bcZqlRNYWH5Ii2gko6iIHLFmdnmspwME+BV7jWvJSdg=;
	b=9b3Lh6IfKBcE+gnSXdReLuzt+ipqeaMFuBOwlS0EsOIzMtnNQTvEM6tL0AvBdn6i9o5Z56
	XJWhGGuOPKlAA4BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795514904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bcZqlRNYWH5Ii2gko6iIHLFmdnmspwME+BV7jWvJSdg=;
	b=b1QYJpJNsr470K3cZYhUGqun0B9y7bL70cReTPK//Zrr0Qro0ZHDLqrewc/PtvaZLgOAx2
	7JK0POsFMohQWIB3gCI3nas4zgS6nmB6BZvcy6QIXsv/SPLk/m0sjQQtz0YT58QUkE0ro+
	aJvsPQQY0kMG46tpA4iwJp3UfhiYL1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795514904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bcZqlRNYWH5Ii2gko6iIHLFmdnmspwME+BV7jWvJSdg=;
	b=rzOrrWHAgvt+HyvpEnm5RyDKQjtELSc45r8pdHrxd3JhkEJygeKiKuUtOpjRp5vDZYh2Rg
	Cjnro1X9aq9bM2Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1165B1339F;
	Tue, 24 Nov 2026 10:08:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KkjLNBdiBWvecAAAD6G6ig
	(envelope-from <fmancera@suse.de>); Tue, 24 Nov 2026 10:08:24 +0000
Message-ID: <0ced8e3d-af12-41cb-829a-109ea25ec07d@suse.de>
Date: Tue, 24 Nov 2026 11:06:51 +0100
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ipsec v2] xfrm: iptfs: make room before copying a
 continuation in reassembly
To: Andrii Tereshchenko <opensource@andrii.net>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Christian Hopps <chopps@labn.net>, Willem de Bruijn <willemb@google.com>,
 Piyus Kedia <piyus@iiitd.ac.in>, netdev@vger.kernel.org,
 ipsec@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <e417c7f2-eaee-4fb0-b365-65cd521efd6b@mid.andrii.net>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <e417c7f2-eaee-4fb0-b365-65cd521efd6b@mid.andrii.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-13.29 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[andrii.net:email,suse.de:email,imap1.dmz-prg2.suse.org:helo,iiitd.ac.in:email]
X-Spam-Score: -13.29

On 11/22/26 2:09 PM, Andrii Tereshchenko wrote:
> When iptfs_reassem_cont() cannot share a continuation as page frags, it
> linearizes the in-progress skb and copies the data in with skb_put(),
> without checking the tailroom. An skb started by iptfs_pskb_add_frags()
> has little room after linearizing, so a larger continuation panics the
> kernel in softirq:
> 
>    skbuff: skb_over_panic: ... len:2884 put:1442 ... end:0x6c0 dev:eth1
>    kernel BUG at net/core/skbuff.c:215!
>    Call Trace:
>     <IRQ>
>     skb_put.cold+0x1f/0x1f
>     iptfs_reassem_cont+0x242/0x760
>     iptfs_input_ordered+0x382/0x3e0
>     iptfs_input+0x24d/0x630
>     xfrm_input+0x12a5/0x29f0
> 
> After linearizing, grow the head if the rest of the inner packet does
> not fit, and abandon the reassembly if that fails.
> 
> Made with an AI coding assistant, reviewed by the submitter.
> 
> Fixes: 5f2b6a909574 ("xfrm: iptfs: add skb-fragment sharing code")
> Fixes: 0b352f83cabf ("xfrm: iptfs: fix skb_put() panic on non-linear skb during reassembly")
> Reported-by: Piyus Kedia <piyus@iiitd.ac.in>
> Closes: https://lore.kernel.org/all/20261119142308.3272570-1-piyus@iiitd.ac.in/
> Link: https://lore.kernel.org/all/20260908224855.1591147-1-kuba@kernel.org/
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>

Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>

Thanks!
