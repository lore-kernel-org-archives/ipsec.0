Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770973;
	b=zMj6e13cDnrit+x3X8DnJ30p56Lh23shyxv7VfQrvulWZ03IQJ0/3/+bD7FH6j1tWi4A
	 23wztJEp1Rj2uOQb+BImpo5f5VYPwDw1GIJG35kjxht1TvM6qpQujzGs9dSyFJ9PPHH5A
	 iSPEVsXEggG5Infxx+vrxhOZ3NUl6O77RPhMOoO4K7yCf7363g/qpp0H9xKvWpfi7oco3
	 9S7J8nzFeutCJtj/qM9Vj2wAkWeXfpVp+OnSDR/VjoU+qjSTzCG5Xvk6HpmDaaNx9G0Hi
	 Io8PQzbdHv8EjkbxdIlaagG5qfMMTRd2kMf0awNGpYZ162iNPgGHQVsNwdwfmLIcbpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc;
	bh=Nx00vavJ/sQmXrO6NCYuylVyOKfcmM2Y07yh/HykMOU=;
	b=QUDDcjUJSLhvZgw9qKU6N5V3yyt88LsvZzZpP/4DUdaFs8v87U45yYBvqKXHXyjTLzqX
	 AWaBvax3gOfuV833ReWiOc6FVNGh5OFbq6EKYCq+1Z1BNNtqsG1y1xnYFUp53dfae7NmY
	 bIWm5hU611SSiLydbLom3Xw32w3qamZ/HB31gw1ZByRu/Gc6wJ/HHYojpEmrR5sjn8TRD
	 IkuMmUBjs1ds6AA8RAguoMXG9Uq/u8Q96KLmnGyEu+/joKVKJD2aWW+B+fGqGg460xqQ6
	 ideUp6NdeHaetGRCip7Js0L/DS6N+Y+RqAj5YKNFWlBduo0CMeUjJTbWZ39jT15onuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+nnxkK4;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E72606A323
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 09:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E72606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+nnxkK4
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2f066a193bbso40609245ad.0
        for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770973; x=1796375773; darn=lists.linux.dev;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nx00vavJ/sQmXrO6NCYuylVyOKfcmM2Y07yh/HykMOU=;
        b=l+nnxkK4yWp6cEugAQmEk5offHYHMwmK8a3iOi7iVsJ3m5FYxL/wD4PURRZf4569Pt
         tWmMH3XUkeoNslrP0fbMdRe6ImD9zC8ZgpQCRqPsBUcHWH3BJ0lDbKUQjGNwPHt9Lkxt
         Ot91Cfx8XxCPvbDOo5YtK++PD3Y1P/S0ozZZyrF49OV9Q7lrq5QaFaC5aiC+2pnRnue4
         HSHrrmkxh8wp2cPdFZUDo9Bc0P7gjEa0V7PTQgYExky7Ugtq6lr6RP7DhTgfoF6QUiHY
         0oUfvIUIPgde/uEsQDSvSSoTgllrCUYV/x60QSgwHOsepEc7+gN6lBje85PvfH6srbn4
         sGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770973; x=1796375773;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nx00vavJ/sQmXrO6NCYuylVyOKfcmM2Y07yh/HykMOU=;
        b=Y32fqn1P+lTQPW/uVrTAzIjkMf7qeSoLARK89Ilajs1bHV9f2PVUBnyLzZ1kcYJ4Xm
         E++WsoR7rE5bUmLtc+tNEjtf9SSvy4bo6j3E12v1RW+/mfuFb3UC8qSz9aS2hG+42MHh
         13uhDbAI6iQS8LRvhdh2mtyFbxxcV4eGzTDE8x9eduLBDzz1+KFKmaywUotn+49qh6dh
         sIAydnqxqm8LouCFOhgf46Eus+/LJW7heD5NNeqo1FYqzo8NpdZPCk6sQH5uY6Jgpg40
         Nma9VOmBwlFA8uxD5uB+nREo6jmBMoDMdtiLxlYtZl+y4U8NVMSde37FOUoIe2hUIuvi
         hcbA==
X-Forwarded-Encrypted: i=1; AL+hErEzOuYQN7Sl34JeYb1M+496eNCWNHmzPF1uSbO5J5BPGd/qdFhS9TalOaYy8fnJ/pROUMoEAg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+0/vgE0gNMC98h6utTd86cgAzHssboOM8DPUbU+BVedWjBd+SA
	DEbaiSk6mHPdStGcG0UuajBXZ3AbaD6ir+pWB4UeNAbexQrToXQrvy3q
X-Gm-Gg: AZFdTZe8mjPVW6gSbjQeN3vDsF0uTYFxIMGRyfhoYH1NcbzmZargCeSFk6FgvnhYPqB
	bDT1fuP0YeAzh1ooLzpG6uswSbWWHwd4vUL0laBwMwU6Xr+QPUI1IgX6/rp1WJxGp8Cw+Zrf9q0
	5woOb9lhZPe2rzyYTJpMhf9XGsMNlxz3J4zUVSAnkbZMPM7E+8kLKrzHhNlE1SBxQivdJ+MVidX
	H/EOAunISRpGkGIRF9iIcTBpW22AVtYRAJmlPMQ44+V4TQZqDH1zbtARtWY/Lqk7jdhqVGp03TM
	q113MHUXClyElx6319Xae3nE0642/yAAXz2iny5s2bieSlYyzG2BdypSAUQdsXdmLaRFlJ9b9o2
	1Av3MksZaO2ta7QWbYfBk+ZdC/gQPiLh0d3qFLQsQZNWnISdJ4AxsmXh52RRiws3Y6yqbqqFrC6
	uTN0RgO3oNV7S/V8299lO9qiiG9O3j39N5NAJ7Bxa9arrx2amU4fY3sJql85oLqzXeZIQqf6/Qq
	+M1jMrQvzFB001OH/GMnpGN9PDC/1twG41Qt13EE5hzru5CtFDM0yu75FmCmvh+Gm06RrUgGwJJ
	16W9eVAZ7N7frTh8Ei0G84MudG9hGYj9ZSNXIyal9KmThAtScs+Eui+8pK0tTl2bXAYuuuxWtIb
	6c/v0CubfonW/Mv0/tE1bSns=
X-Received: by 2002:a17:903:1acc:b0:2f0:a113:4e46 with SMTP id d9443c01a7336-2f0a1134e76mr155413505ad.48.1795770972894;
        Fri, 27 Nov 2026 01:16:12 -0800 (PST)
Received: from [169.254.212.233] (ec2-16-179-105-217.ap-southeast-2.compute.amazonaws.com. [16.179.105.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10c9casm117276575ad.52.2026.11.27.01.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:16:12 -0800 (PST)
Message-ID: <71e47f31ab9eac91c07bc3b9535c87ef3723b961.1795769101.git.n0ps1edzz@gmail.com>
In-Reply-To: <cover.1795769101.git.n0ps1edzz@gmail.com>
References: <cover.1795769101.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 14:38:01 +0800
Subject: [PATCH net 1/2] ipv4: route: fix use-after-free in
 ip_route_output_flow()
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    Kuniyuki Iwashima <kuniyu@amazon.com>,
    Steffen Klassert <steffen.klassert@secunet.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Willem de Bruijn <willemb@google.com>,
    Hangbin Liu <liuhangbin@gmail.com>,
    ipsec@lists.linux.dev,
    linux-kernel@vger.kernel.org
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list

ip_route_output_flow() drops the RCU read lock taken during route lookup
before reading rt->dst.dev->ifindex.  The rtable remains referenced, but
route teardown can replace dst->dev with blackhole_netdev and drop its
reference to the old net_device.

A concurrent netdev_run_todo() can therefore free the old device after
the pointer is loaded and before its ifindex is read.  KASAN reported the
resulting use-after-free twice while UDP sends raced with dummy-device
teardown.

Load and dereference the device through dst_dev_rcu() in an RCU read-side
critical section.  This requires netdev_run_todo() to wait for RCU readers
after flushing routes; that fix is a prerequisite of this patch.

OpenAI Codex was used to analyze the supplied KASAN traces and reproducer
and to draft this patch and changelog.

Fixes: 95c47f9cf5e0 ("ipv4: call dst_dev_put() properly")
Cc: stable@vger.kernel.org
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
 net/ipv4/route.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index cd69242af..b16a9d05f 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2982,7 +2982,9 @@ struct rtable *ip_route_output_flow(struct net *net, struct flowi4 *flp4,
 		return rt;
 
 	if (flp4->flowi4_proto) {
-		flp4->flowi4_oif = rt->dst.dev->ifindex;
+		rcu_read_lock();
+		flp4->flowi4_oif = dst_dev_rcu(&rt->dst)->ifindex;
+		rcu_read_unlock();
 		rt = dst_rtable(xfrm_lookup_route(net, &rt->dst,
 						  flowi4_to_flowi(flp4),
 						  sk, 0));
-- 
2.56.0

