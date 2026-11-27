Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770965;
	b=vBhPawCCubQUtEEq3je1ZXgqghE02x5iEMgsVwcz9qcDAnvEocvJwJoV4RnY2QVcG7VG
	 fgr2UtM2N/hhJvLhpWN5UOPxx20HOEKm1VoRLUXB3klsToOEqBFfVIEymxBupMrLj+ECC
	 sX5RQfPrJB7+BONcSEy8lKZQHQvvqdZcJGgXqZmTax/OZcz7Ft4pFi9Em4DT1gi1e5ilI
	 dIsIKRtTxfZa2umzJufqmzjpecfwoUGxH/Fr3hvvf89t3FOACLfHprv/bKOwNTwV5KO02
	 LQXDYSu6zEWEelyihQmHzQCB/ZmosghLIrnn8GBZcnjbfflozU4kntjgxgK5I6QRKsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:From:Date:Subject:To:Cc;
	bh=ukrk1CqnOAilXLbGctB4tN4mVESCH/x3pN6OGouAXZs=;
	b=FFxQ5yzdeybrTOyvKWhIXarvSdgYetDFccIMze6YqV1UGhsvh+PkH/kvOquRBEKedEXx
	 vbv2LU740fMHpUMGmqMd/BQGsSYOd8KWxlYvMqVcmlBksF9pkp4dHzADe8ZsJ28saoyXP
	 uWnQtvVTm+WFNwkxS11L4zl4tj4XFowGKeRlU+dhJkVRpbXwbAHbavWo/12oojNJ1wGVl
	 XQCDGTdfwv0imY5dBM4gI1q1wLNeUJB8Yx2k+533t7qrVYg7ZltCDSeTRS9QdwfUHo4Iw
	 ZmpZXl6NpA7g6BWY0M1Cs8ihw/OSfmqW1mg6mi2N6X5Yhb23yc6xIHWaf0oRTBkKVMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUO4gK+E;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B54606A321
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 09:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B54606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUO4gK+E
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2f042b6ef3aso56678125ad.1
        for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 01:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770964; x=1796375764; darn=lists.linux.dev;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukrk1CqnOAilXLbGctB4tN4mVESCH/x3pN6OGouAXZs=;
        b=NUO4gK+E+Ai+ZzEJCQwaKjHWvPapr6aWV7WVYk6mbUj4dNtEpHdEHcP8o5VUuJ5WHc
         CVfh9jjfMMC4iMtXex7MnjDr2KOI4VWYwUo9UNWQ+X/GSLmDoLUgpuQRIG5yjB0ibjzX
         anTTa/PqNa25GtlAPvO80BPxgq9ax4zb1anZIp5cXHmhXHIJFbj9BO2X9MUIfwN8o/Tf
         SZkQl1uP43kALPsa6alkClUbYHnC8X51UYqBnpXbSqrrLL13PDSrtA1dBa1FUB8IIcWk
         vH2yh2OzErjRY0frd4zaqMLfJPlOxXqu0SPHVLCvtlSU43opwLZEqvJtbc1BPDX/TzVg
         XHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770964; x=1796375764;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ukrk1CqnOAilXLbGctB4tN4mVESCH/x3pN6OGouAXZs=;
        b=gb6qn0rx2ioYJx+dDUAdY6YDu7LxhhfEz4YeC19709OJO5e/logVX2PabMMlpkxtOC
         G8WcdKpbHW9gq1wJ+jQfyMw4Lxk1fgxILxRoBYxabbMmoSRU79cEk4GesMqqwWcSPWnq
         m9XJIMzK2mJEwQPyQ50wQTZDyYtvMCyge1A2pLOKCdV0GOtMNVNKPBCC5u0M7VWpF4Y/
         5060rv+PWIeOupARq4LCTMPMT1x6vZJdWVDwsGBb8ho0Jum+R+wktZewP+ahUWSILRCD
         Ylr7qmSHTixAnDs976qZNT3EkK16y+pmgOHDCN/kPGWTK8xTWODoL1xoRnClwtOAiaB/
         eA/w==
X-Forwarded-Encrypted: i=1; AL+hErHbueLSGsFCpEZAByy5bwyuGD9hPSPDjl72q3LcDtBuAmDJOI4MTe5yF/GSvvS49c6BUmDE9g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8i+aN16hXQdE4BtLMYmtdciMVDYer+ZZRtxJ1B68N5KGXfsury
	i7dI+QBM+SU3WICpjWYhzJAAI/fDskuUfrcK53gguNFtjynzgVppE88/
X-Gm-Gg: AZFdTZfEgueoJ0TzZJJ1u1Dz/Jr/9XYyUSDHDS51NgCU7KEBcvJZnfbBl6BblfxktBw
	I0Tpqiqom9p5e4HLT2Akb6IiCTEFTu3e3FLSVN6rpDWE6uoUQe9CLymlsYdHKDkQ2TatjX6OlOX
	AA0Ab5wzQQQTygefKzJhE4iFitUHp7Djlu8V0vXUepIrNeGCmMJwXViPrlkz/Xr5Xr9Zeq7gMa3
	ris3hZTWfuc9FN8FRGd8ikpAKBjZ+xfI9JQPHXJqx88ISgyQ22udnykpOffCqEoxcRaLDLef64B
	gZ3CJa7EPIuEHVVIhYKEdiY2Y3nSd4SZarJlmNcFkURH9kOjt8zbIDdkwr7B4OSDsl5hJR/05jx
	eEsr5hkpmG2u6KsJ2u1pLSbLPxENVCmgCd8ftpWEgtW0TGZcwOI+huTq1AIF/7pRmSAj27RTca1
	MlAOB4JkYAiPRrPtLB4dA+C6Gh7rULPyY4EIRJonQRo4tg6PNyLYyeuFLuKYzUpurAmdo16+gu0
	+d17apGRW8WR7+0D0gxFB0a3lMYBFEdLHgDGVfKZxc2hhzuUnAHs7FK6QvhhNLH30AbvWji+/iB
	GBBNckcRutsbEcH3YlIGScdiszfOltHyTHVkPUqM0Ns1glbW0q69I5S5EQCmFd6B694N4ZHeCw/
	VyGEobldNvb656IMF+mgJJFg=
X-Received: by 2002:a17:903:32c3:b0:2f0:6576:280f with SMTP id d9443c01a7336-2f065762a04mr236624405ad.19.1795770963963;
        Fri, 27 Nov 2026 01:16:03 -0800 (PST)
Received: from [169.254.212.233] (ec2-16-179-105-217.ap-southeast-2.compute.amazonaws.com. [16.179.105.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10c9casm117276575ad.52.2026.11.27.01.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:16:03 -0800 (PST)
Message-ID: <cover.1795769101.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 16:45:01 +0800
Subject: [PATCH net 0/2] ipv4/xfrm: fix two dst->dev lifetime races
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

These two dst->dev readers were found after the four-patch v2 series had
already been sent.  This follow-up contains only the new fixes and does
not resend any patch from that series.

Both patches depend on the post-route-flush grace period added by:

  [PATCH net v2 1/4] net: wait for RCU readers after flushing routes
  https://lore.kernel.org/netdev/ae140ad9c69d3403d3596b1187b86fdd232292e8.1795754281.git.n0ps1edzz@gmail.com/

Please apply them after or together with that patch.  The
prerequisite-patch-id below records the same dependency.

dst_dev_put() can replace dst->dev with blackhole_netdev and drop the
reference to the original device.  The route-output and XFRM no-policy
paths still had direct readers that could race with the original device
being freed.  Convert both readers to dst_dev_rcu() under an RCU
read-side critical section.

On a v7.4-rc2 net-next KASAN kernel, the supplied reproducer triggered
the route report in 2 of 2 runs and the XFRM report in 3 of 3 runs while
deleting and recreating a dummy interface.  Fixed-patch runtime reruns
have not been performed.

An x86_64 defconfig W=1 build of net/core/dev.o, net/ipv4/route.o, and
net/xfrm/xfrm_policy.o completed successfully on the exact
prerequisite-plus-two-patch tree.

OpenAI Codex was used to analyze the supplied KASAN traces and
reproducer and to draft these patches and changelogs.

Zhou Qiuyue (2):
  ipv4: route: fix use-after-free in ip_route_output_flow()
  xfrm: fix use-after-free in xfrm_lookup_with_ifid()

 net/ipv4/route.c       | 4 +++-
 net/xfrm/xfrm_policy.c | 9 ++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)


base-commit: e1055cbfd6eb578417f3ce983cf44462e8465267
prerequisite-patch-id: 0e86b27e6eeb1f9bdcc54de4115415ecd29d4e70
-- 
2.56.0

