Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683469;
	b=xrm38qbJz5+wmeMONHuJVcxqTQ8tDM/WMUZG4oHGNASUu5ybX1ULnIzSGIvjAb+0XDJx
	 hy9xi4chYGJgAmUnS6SqGRDhG/WYnK5s2TNyjCyuM6l6qa9LcskYyIfo/6i4gAmaMDuIm
	 HhuywxmZxNtvVTfL6nma3LiVmJ/t2L0TErRT4wnxLAEIMVaR6boQThukBFTnNK/0RYk2M
	 T9X7YDH+uNCDrFZ585CxPQjLNM+xZBcsp2ywNQRpLidkWI1Tar0w+xmnlV3aFfn4g/Eo0
	 Kygqqzn28+BFavPM9//FFOHls7ynJ2PK5S8aOt7lE3SRpVtu5HXE0KKmINgP6DmiUqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683469;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=AdLL3Q53BHJLoBt9CSRYGYry3kTUEfgH4omIXprvDe8=;
	b=JWtUobpQt0oW1JRVWdcC6S6Ce6xtDLsekih+rd+Dhb9ZGu1l+gXuHyfiP8HamF4x/Qk/
	 zvl+nccZHY9SOYJ50QxevSD9zkfDZQdNZdsz6V26YRD0FQHQjsIo69hUtmk8WDt5gh4Il
	 ///tV5Ewvr5mvawE/lTU3Ygrlo31fdH+yTiO8oXi+GcU+51HcfPKwf6A8s6+kmJvSzW/G
	 jTBSUoza/1Qh+bQ+caZp/A/RT2wPF4ScMDJ1dMORogmoXCibBkV88z4soANRnADKNefGi
	 7TnRooHrM4wy8/I+v2bFZN9CNjRZNcI5qb+lfvz4tNmy/w2WC4L2DJkdZkmg3Bb/DAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=uG0UZuWs;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C6F606A32C
	for <ipsec@lists.linux.dev>; Thu, 26 Nov 2026 08:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7C6F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=uG0UZuWs
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id B5A8620758;
	Thu, 26 Nov 2026 09:57:46 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8zdpgIyEFP4v; Thu, 26 Nov 2026 09:57:46 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 21FB7206B1;
	Thu, 26 Nov 2026 09:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 21FB7206B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795683466;
	bh=AdLL3Q53BHJLoBt9CSRYGYry3kTUEfgH4omIXprvDe8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=uG0UZuWs5XmZi7MZQ9zamgII2bTngTWGFGOex3D+bxcFooMsSC2G7ZIWNUzyzJ11I
	 ld5z8ORp7SGRslMa8exrbAfRu6oUk8FRwWLaBAwkNr8WyJF+sue/wOhUiMpYFPdPRX
	 C+0Wx2BBJ8Wb4/IHgchCz0RJPJHYBAnpvkHE9grcVUGmpj8n6W5YWOVzvK7r9R6dQ/
	 mbXWyYf0lhLQ/IrpJWg7sq3PWBK+M6zzRPvanbcgMbM76UCflduxpdtQ3yXco/DhaG
	 20RNmFoUiEUZINEuwLVHB5+97N19q+LQXRtw5bKtzHrxzcIFxiFTiNbRQ1oW2IL5eM
	 LaOVOkNS5nFUA==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 26 Nov
 2026 09:57:45 +0100
Received: (nullmailer pid 2021184 invoked by uid 1000);
	Thu, 26 Nov 2026 08:57:45 -0000
Date: Thu, 26 Nov 2026 09:57:45 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn
	<willemb@google.com>, Simon Horman <horms@kernel.org>, Kuniyuki Iwashima
	<kuniyu@google.com>, <netdev@vger.kernel.org>, <ipsec@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH ipsec v2 1/1] xfrm: free the policies already cloned when
 a socket clone fails
Message-ID: <awf0ibmT7f-IzSup@gauss4>
References: <179540803323.3139700.5340002553684152759@gmail.com>
 <179540803323.3139700.15088508372382876389@gmail.com>
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
In-Reply-To: <179540803323.3139700.15088508372382876389@gmail.com>
X-ClientProxiedBy: EXCH-01.secunet.de (10.32.0.171) To EXCH-01.secunet.de
 (10.32.0.171)

On Mon, Nov 23, 2026 at 01:29:42PM +0900, Kyuwon Cho wrote:
> __xfrm_sk_clone_policy() clones the parent's socket policies one
> direction at a time and returns -ENOMEM at the first failure. If the
> policy for the second direction cannot be cloned, the clone of the
> first one is already set in the new socket and linked on
> net->xfrm.policy_all. sk_clone() then frees the new socket without
> xfrm_sk_free_policy(), and the policy is leaked until the network
> namespace goes away:
> 
>   WARNING: net/xfrm/xfrm_policy.c:4303 at xfrm_policy_fini+0x24c/0x300
>   Call Trace:
>    xfrm_net_exit (net/xfrm/xfrm_policy.c:4372)
>    ops_undo_list (net/core/net_namespace.c:253)
>    cleanup_net (net/core/net_namespace.c:713)
> 
> Delete the policies cloned so far before returning the error.
> xfrm_sk_clone_policy() clears the new socket's slots before cloning,
> so a slot that is set holds one of these clones.
> 
> Fixes: d188ba86dd07 ("xfrm: add rcu protection to sk->sk_policy[]")
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---
>  net/xfrm/xfrm_policy.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
> index cea6842e6454..dba1851f0b3d 100644
> --- a/net/xfrm/xfrm_policy.c
> +++ b/net/xfrm/xfrm_policy.c
> @@ -2460,6 +2460,13 @@ int __xfrm_sk_clone_policy(struct sock *sk, const struct sock *osk)
>  			rcu_assign_pointer(sk->sk_policy[i], np);
>  		}
>  	}
> +	while (unlikely(ret) && i--) {
> +		np = rcu_dereference(sk->sk_policy[i]);
> +		if (np) {
> +			RCU_INIT_POINTER(sk->sk_policy[i], NULL);
> +			xfrm_policy_delete(np, XFRM_POLICY_MAX + i);
> +		}
> +	}

Do you really need an unroll loop here? This function clones
at most two policies. If the second fails, just delete the
first one.
