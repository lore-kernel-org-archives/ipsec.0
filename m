Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191647;
	b=xhv+MxaaQ7IQXnoMFSikkClbNEusTTPx679c7H7kKz5AADbPt48O3knIdHgJaYTVtStw
	 QU2yV1AnOUjOjZ93hhvtzJ0+RjHlQS1EWFv1RQ89fM+r2aN+j4sL/OxK+oQzeuZ2LvS/n
	 hl8Hr79CJc/ryxchGPDcbs3GGhcTnhsyjWHoC59AHBG5BYtrzGFjMVn3rawA0BBZq5w0G
	 oNhGFuXys3glgGVnpQrqOm3Eg0dAGOBA2bVnnH7d58MgONa/ipwQGcGMSM/RU5C2ZBF5m
	 grtZcyc6tFEa+ct9xthe7DjecFz5NQpqJzXx1kzy4/1Wk0gm330Wk0FJ1KDQtyOqxng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oRxpEC2GG8v+kUysfDv1Clo2J6a3wzMDb38qxEUjywA=;
	b=NPuU9h6JnVeTPeD7l4tpe/pxBpCt1IiF9ZwLmqdG8GZKOYu6YZm6Ax60LcO55Ci6U405
	 0yKDFBEu8Z+J4n/syDRtRXJbm2+cNeceJsXWrrfAsQDpwFYIEoybj0bw5O1CiXoqLiN+x
	 DQ+UajwvoHgin0fjrmHNenbGlf++AQ0COaqDWeECPnIGFHvAXQ4YF8ZV8LuU9PdrSmpk7
	 xrL91Er5iR2O1+nQJK5cwz8N8ApdOQfwBhP83chLFXV3ffl+rk7p7Kd/snxIQVWQlvE4s
	 dItmr5sD++J5JEmCZX8RT1HkmiUEOkSo4N6tM/mlMQalW+9nD7//vOhlVO7+KJ5L34A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=PmpXmKMB;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71222606A33E
	for <ipsec@lists.linux.dev>; Fri, 20 Nov 2026 16:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71222606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=PmpXmKMB
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b439e37813so267951a91.3
        for <ipsec@lists.linux.dev>; Fri, 20 Nov 2026 08:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795191646; x=1795796446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRxpEC2GG8v+kUysfDv1Clo2J6a3wzMDb38qxEUjywA=;
        b=PmpXmKMB9wf2Uk+XxRPCcraFwIdiBfZN78Ck0RYcG3DRpSPhmpDLvaZ/Ltf2xogEQj
         97jFgohNf4YHgIwvJf5xOrN17sfVuhphNaGzI3mgqzKOfj6fyWTOnfRTf+m/Woe8fbs9
         gQOo1R1Fkk+xxGu8gic3UqhWeNo/CYdecZz2Gj1QrZ6Bg6C1hvQ52X0rYayzB6Iom+8A
         l7jZRvCl/0jCS/mUci0ZwgY3E/RRl5aOdkpOIoOU5UH4sC+pPCh8KlUxHfouonjQOmMG
         5ScFkRQE+Iu+sdzy9jJkRheZBUXS33kuuR1V6xr6U6JdUOewRCx6shmijD0SVARQb0vZ
         o0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191646; x=1795796446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oRxpEC2GG8v+kUysfDv1Clo2J6a3wzMDb38qxEUjywA=;
        b=EszAgWBOyvIi3A+gEAu3+0zNBqbvr6YvhVq6Z5mfFuStE1BKayYcB1w+IGHCGCgfMF
         62mhE83u/pyyfMV78KKhnaqx2E4lS19wEonxoptueYInB81ozyhKa2z+NwwGqbtwJOgS
         rfCOnD97LWlGMs1qnlrwGIr4baZPDJ0ib1/UE9LoUykRe8+l93pmhGDbSi0nSNjyV6Z9
         Ze9o+Hm+srWxYe0UT7r5wQRz82Q/EDbTt18qSHAdGx207wMdtwCxbEbTA42NsMYc37yR
         TCeoESm9APDVb+bhJUoP8CkOhLEVu6hmpO5Y5xIAM0aJ2v8uSBQbEpKNV3Qz4ymAH/oU
         x8/g==
X-Forwarded-Encrypted: i=1; AL+hErGorGpJJQGiEMNbSnQ467IYOpGPAEDNaDD7H+zq+x7pSz2UpPqKVcKc3gSWSEAabwLdMVdAMQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+OXhDWjlxLZixk6552+OoabmJMHCmPBkFLiIXt2H/pVJWICcQc
	YE9jr9NWoxtMdl/SolIwjVGaj91tgD4+lJtIIUVGpuvojRcMBCiKexIIAj0qXfk4E+g0jjCI5XR
	1a9yGoXL0pRSqqWqJGhwM2W5P+oozZ6gZvoT6/cT/MpYxiaqTIdhi
X-Gm-Gg: AZFdTZfPqFRI1uajO1EduECafkp35KGqQrRmK61gLIoizGuBsEK2578eRrSAEvxce3k
	U2w2In2zZb52UFSdS8+IHbSa5odE4YCKtBKwe9Riw2hKd3i/kgcPkW9spwE6I7tKIV0px2hzIkI
	vaWZV6WL/c1bEGPHFzDPOVGs1FNjO+eDEkXZ6gw9z8VONCc4PF+enQM+xlzBt3LtuL8gs7KAA/Y
	4tSLOXRnEdZ5qFO/sxjEK6MmMVGz1xf5syEymuMIvyuQrXaNbrZNV/+sZdN0c6PTPDysbeM7tEd
	huoawU3mTvjCMAsBmoxhdDse1bKdmx1HKWEQKiI9zNqf9h4Apyv8cjw7l1tmu03+TxY2LiHQk9t
	P1+x8/cDvur53ZI9HGwd+JJ0sRwY=
X-Received: by 2002:a17:90b:4b8b:b0:3b3:b9e4:e3ed with SMTP id 98e67ed59e1d1-3b41cb47a0cmr3245756a91.63.1795191645728;
        Fri, 20 Nov 2026 08:20:45 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm3383925a91.4.2026.11.20.08.20.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 08:20:45 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	Piyus Kedia <piyus@iiitd.ac.in>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH ipsec] xfrm: iptfs: make room before copying a continuation in reassembly
Date: Fri, 20 Nov 2026 08:20:40 -0800
Message-ID: <d9a8310d-e139-4edf-9cf2-4b32664facb5@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <ac558468-8e5a-4b1e-8d4d-591221b2dbf0@suse.de>
References: <ac558468-8e5a-4b1e-8d4d-591221b2dbf0@suse.de>
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

On Fri, 20 Nov 2026 12:18:09 +0100, Fernando Fernandez Mancera wrote:
> This commit message is too verbose IMHO. It is quite hard to read and
> understand.

Agreed - I will shorten it.

> Manually accounting room and need allow us to perform a single
> allocation but I do wonder, is it necessary? This is a very specific
> case.. maybe we can just call skb_linearize() first and then check the
> if there is enough tailroom and perform pskb_expand_head() if needed.

Agreed. In my tests regular traffic (HTTP, ssh, scp, ping, UDP on six
NIC drivers) never took the second allocation; only packets arranged
for it do. There it costs one more reallocation and copy, but the code
reads better. The first version of this fix did what you describe. For
v2:

--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -909,7 +909,15 @@ static u32 iptfs_reassem_cont(struct xfrm_iptfs_data *xtfs, u64 seq,
 	    iptfs_skb_can_add_frags(newskb, fragwalk, data, copylen)) {
 		iptfs_skb_add_frags(newskb, fragwalk, data, copylen);
 	} else {
-		if (skb_linearize(newskb)) {
+		/* A newskb started by iptfs_pskb_add_frags() has little
+		 * tailroom after linearizing. Make room for the rest of
+		 * the inner packet before copying.
+		 */
+		if (skb_linearize(newskb) ||
+		    (skb_tailroom(newskb) < ipremain &&
+		     pskb_expand_head(newskb, 0,
+				      ipremain - skb_tailroom(newskb),
+				      GFP_ATOMIC | __GFP_NOWARN))) {
 			XFRM_INC_STATS(xs_net(xtfs->x),
 				       LINUX_MIB_XFRMINBUFFERERROR);
 			goto abandon;

Thanks for the review.
