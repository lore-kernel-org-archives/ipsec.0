Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683584;
	b=YxS8iKkmZ11cN1sdadCH43EKpJ3JhPRgP5zLsnBCojqxNPPTZeT0upfhfBppaedYRdRZ
	 Qur1za0EOV5bSdWYwa7E1jVjGxvd4cyE0CnliLXm6SvHdJhZ27O324PptmAjNmb+pxH1V
	 EpM69TR2V+1ZQ+816ij7xMd+CdmhchxofmaKxiZAodgGLCy0G51UjJgYsfPXuGbycAfqq
	 khoSpMlI/V/1RT9C5qNMUUJqatQx/Rp1JXgn529SlzWjwcy+OO+7e/EkFBZBoaSRLOVie
	 QN8coDdi1K3mp0bICvLVVKASAs54VlQZXPBfJhp2myjaNTHYC+PuZnbV2LvJTDsp0Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683584;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy;
	bh=EL1asoxpJj3mS6PiWh3IZjA5s9JX+P0EoH0x0jJdp2g=;
	b=3hhbyiL0+E9gupe1EonxwputDWhviYr1065bSgyh5S3QjLNQD+usdYboHHQBZuYlyzxs
	 THyUS5Em83wEAD05x3g1c7DueV6H00AtR/WKjZ4rHq1lBXoj7gqoEyOI+xEdgYxVI4Yma
	 P65ywZFp0etWle4PoQASvIVqkRhYaqmVqk77IksqnzOxsJ/DAOTVF7NAoCSXwKy+QM8fZ
	 DXV+9AfeomRplI2Abi/nnVhDWkEZW4xmUCvdaYSZjGC1JsamzVNDRf0O9HiVtuipMftmi
	 6irq6KBKHdg+y9pCgbsQqnt5diy7fE2BL8n7mX9MhTNFHnvyCVStkPfp7onAnUXk8Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=RvkrkkIe;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCD6606A31E
	for <ipsec@lists.linux.dev>; Thu, 26 Nov 2026 08:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DCD6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=RvkrkkIe
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 0235020758;
	Thu, 26 Nov 2026 09:59:42 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGYa7rv3mnB7; Thu, 26 Nov 2026 09:59:41 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 513D2206B1;
	Thu, 26 Nov 2026 09:59:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 513D2206B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795683581;
	bh=EL1asoxpJj3mS6PiWh3IZjA5s9JX+P0EoH0x0jJdp2g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=RvkrkkIebhzr0A3lbnE+9iLG/GwSN9NTC7XwPIGoECQChEN+etcsdjmc/1bC0doOv
	 Bte4BMRxYrMAlNtZJ7QLhT98i0jxxb5d/d7Av1UVcmc5VbNt5/w64eMZlwtC6myLNf
	 cZcira65E68qJMSgNPHqPMm8c19G9yiIEUpsdrY6pZeg6nY+dYDnrWiEe9ZiLlGtp1
	 rJWgi3OzrJ30/dFufABaUHIR2syV/VpAFpg9kW28H4gkZa68d/mWI9i9oBXaFcB593
	 VFvUPDIX5bl822WnLO4XX389qO8uzFmYb7u62WK9m/4RVgvV01KJlO9kfJpI9VA3EN
	 MWmgUtxpwOObg==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 26 Nov
 2026 09:59:40 +0100
Received: (nullmailer pid 2023310 invoked by uid 1000);
	Thu, 26 Nov 2026 08:59:40 -0000
Date: Thu, 26 Nov 2026 09:59:40 +0100
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
Message-ID: <awf0_Ksi65pXTtEo@gauss4>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179540803323.3139700.15088508372382876389@gmail.com>
X-ClientProxiedBy: EXCH-01.secunet.de (10.32.0.171) To EXCH-01.secunet.de
 (10.32.0.171)

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
---
Author: Kyuwon Cho <kyuwoncho18@gmail.com>

xfrm: free the policies already cloned when a socket clone fails

This patch adds a rollback loop to __xfrm_sk_clone_policy(). If cloning
the second direction fails, the loop deletes the per-socket policy
already cloned for the first direction. Without it, that clone stays on
net->xfrm.policy_all until the netns is torn down.

> diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
> index d2e938d4db9aa..e5b51f5f64306 100644
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

Discovered by: opus-5-5 · Missed by: sashiko-gemini
This rollback only covers a failure inside __xfrm_sk_clone_policy().
What about a failure later in sk_clone(), after xfrm_sk_clone_policy()
has already succeeded?

In net/core/sock.c:sk_clone():

	if (unlikely(!is_charged || xfrm_sk_clone_policy(newsk, sk))) {
		...
		goto free;
	}

	if (bpf_sk_storage_clone(sk, newsk))
		goto free;
	...
free:
	newsk->sk_destruct = NULL;
	if (lock)
		bh_unlock_sock(newsk);
	sk_free(newsk);

Once xfrm_sk_clone_policy() succeeds, newsk->sk_policy[0] and
newsk->sk_policy[1] hold fresh clones. clone_policy() has already linked
each one on net->xfrm.policy_all and dropped the allocation reference:

	xfrm_sk_policy_link(newp, dir);
	spin_unlock_bh(&net->xfrm.xfrm_policy_lock);
	xfrm_pol_put(newp);

bpf_sk_storage_clone() can then return -ENOMEM in three ways: the
bpf_selem_alloc() optmem charge fails, bpf_selem_link_map() fails, or
bpf_local_storage_alloc() fails. The free label only calls sk_free().
__sk_destruct() does not call xfrm_sk_free_policy().

Won't both cloned policies stay linked until netns exit and trigger the
same xfrm_policy_fini() warning quoted in the commit message?

A TCP listener can reach this path from remote traffic through
inet_csk_clone_lock()->sk_clone(). The listener needs IP_XFRM_POLICY or
IPV6_XFRM_POLICY set and a BPF_F_CLONE sk_storage map attached. The
storage clone can then fail under GFP_ATOMIC pressure, or every time
once the charge reaches optmem_max.

Would the cleanup fit better in the free path of sk_clone(), so that it
covers both cases?

That cleanup could not be a plain xfrm_sk_free_policy(newsk) call. On
the !is_charged short circuit, xfrm_sk_clone_policy() never runs.
newsk->sk_policy[] still holds the parent's pointers from sock_copy(),
because sk_policy is outside the __sk_common dontcopy range. Those slots
would need to be cleared on that path first, or the parent's policies
would be deleted.

>  	rcu_read_unlock();
>  	return ret;
>  }
