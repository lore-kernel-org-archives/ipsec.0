Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795152507;
	b=CH9LqrNZc0hbkdOzhE1irC8UcmGIGS1WhXPP0AsZnV0EZRmR96COee4wnG66n0t/PlMy
	 2BY7/Nkym0n6I2xbbI7q1LyLoUVGUauNgSC3HImeC44xyo5L/VV6XiRHKdEQ0Kl12ejmP
	 GWA25CnpN0kIO8rICa4SGNq/vIUCgFaivVhpKEVgM0L+nX30TunONAywZCZpfcZlj5Gun
	 psINQtnuXh/ovVAafIC5X889zyb4YvppP1P+zfWpBzq8CrY48MKsdMEQHVSZtgDdtDauG
	 XHxUKpdhhCSAgONf8kTPLmEsPphO01CCJIQ6pBTQLDI4RGeBGzGPfaN9jeUVdYR7jgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7ERUV13pYbEG+uwgbT5jjtIsKXtfXcMiUyjhVeq/SAM=;
	b=n8Tr5aLWSs43XQoppA8Ckig5Ox0UW4r7QCdQCYBKy/iaxpqfd4YvDNQAicQu8c9R6QNm
	 g+0t5M8+sih442RQ4CZgudjC8KerLDwHTb7OhJ8aaGXi0PQbxuur9kQ50hB0Z23QxDicy
	 H9L0BcdFqMP5nM6wZSY8kMtbN1INWXHbI/ZGDVmYj1qDxUUlevpvHQnJhraGI0tHqCbkk
	 13ywZbaACIwrMih7GRhuC5HZA5/NrYCyDcBLrVi4trrTh5whneXYqiIB+MRt64qZYEhO2
	 3lGIp+TaNp4TNwCtcKcni+s3Jo6IS6EBYHcsYYvLyzc8pjFZ7cTyFR3O8u7uXlVD8OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rXB4uHEQ;
	arc=none smtp.remote-ip=74.125.231.192
Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E3A606A326
	for <ipsec@lists.linux.dev>; Fri, 20 Nov 2026 05:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9E3A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rXB4uHEQ
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-533fe730856so174488b6e.1
        for <ipsec@lists.linux.dev>; Thu, 19 Nov 2026 21:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795152506; x=1795757306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ERUV13pYbEG+uwgbT5jjtIsKXtfXcMiUyjhVeq/SAM=;
        b=rXB4uHEQTEdsFyVku4rf7U2JYCjC5vx2RvD8UQhah6cFSdVQN2S8KS4xKW0m6y+PdV
         jqRyq/YuNtZOKCY4Y47SgUZyp3VtT5I4LxB3QSbjT+9JKOE3h07oGeFX66zORImJuBbv
         SDFKbQjH6ymRvGgpDt3hMWJlbtVxvdiCf8cMA3JcUP7eXgz6xZLDdXDVvhfRA6VqOdj2
         YYdibkojJlf5Xqqt6hNt90HBtCicgVEjwpoq7o53Jwj48HcjyKyw67YwDbumG7DUUq25
         ua0JBh98M667vkvlebkzfRCetiEVvY4uTmrIlFRHmcPWD5J4xIvWkMMktbrp6N98Eg4s
         3UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795152506; x=1795757306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ERUV13pYbEG+uwgbT5jjtIsKXtfXcMiUyjhVeq/SAM=;
        b=gg15lYr/KNkeaqWa3EK9+Yg/qq6ZJxUyqflzxWhIPe+VlABX9sn1heuzo4hLB5S5vK
         7mq3RKxZircCo5li3Hc1Uc9+L3y13JUEymu0g+P6s4F2om/2VCZoUfpE55fTWz3tnT8Z
         XBKFzGa7Ob+DJYJYCNu80xdxJ/xF7BbeomuYQI1h4xzHsKuSKktnG8p/x/v9kVTOkSIX
         Vx3JGIgz40zlzj/pOK9fpwARWmhOltY+Wa9gqvrW5o8O3gEte0BcmkJ/Amriv7qu9di5
         s2HBHBeqG9CjwASSc1wRSQ6aDVduQ/ArlXu2bJ+5pbVPkceE4lkNCIifoesAr85D5hQx
         t1zA==
X-Forwarded-Encrypted: i=1; AL+hErEns2tQlr8/jNPBFntEfRabz96xabql8kYqPIjsThvAWJWbFJFTNBXrHtzqfpagqNfapb5v9A==@lists.linux.dev
X-Gm-Message-State: APuU4Z+fBaEZEBj7OaGT2NV1SM25b6k+yfYr5IfvZpxDN6oJzpNcYQ20
	vc+RxPsG0NQrWQNxAgoAq7vPlxZIWfQtX59KAJ7jtCQRnM12/n6SJzLu
X-Gm-Gg: AYBFou0/1qdzKv+3Q96kGx57tjAUrRtjH0NjSIRDZvbeJGc5JH3JHxJNNcFgd8LFrNn
	WormbE4FJBXaB8QOMD4qgZkRq/KBppZTCMwBOVZuX2mTScwMOVVQk5nr3ZnSjr6T5BI5ljKmwRW
	kZ79sMPwWciM9D7OzXDRxtuVSG2KkwYVhH28zcnM8phATxazIigE5l9DOhXSpscmCNivoZmRtYr
	/uRjdWJ1iYCiEOB5ctwU0GiLwff32gRhQ1MADM1YfmBdJ23KdthcALgHlaECfV7XhV+ahRlt1df
	SFEzoVuu/UItA1ESAgp1p2Af5XnWa3RlEjYT0HvJ5EOy0RmMQ5p4XB21TtPfQ/+nWSLqvcWz0X4
	LuYWZoQdcQcSV6lejMqA30JFOuNLkkLdzqhH/VFBB5pDc8GAJk4LLDyyYIQrSlsrDPlfK/dS71o
	np0osdP4Ou2TuUthIAt53ZGCrA3pL/ZKk9yIxPZRK7EOTYgUqAEHKJEwudecWZ1f9D4jIGA5qcf
	uO7qiNapYVaw50sMI2/C/THcJEqK+bq4acv7rZolIkdNsClObSgx9IU4xly6CWOCdcT7d96SbfX
	oBv0GXNMthfC5rrViPtp5916LO2U8SqMdG64gnOBRjUifS+AM3neyVZMqypURpQRe0E4rtNCXta
	Ti0T7i5iENKhjnA==
X-Received: by 2002:a05:6808:308b:b0:55c:836:5950 with SMTP id 5614622812f47-57a0a91fc0dmr2909965b6e.27.1795152505746;
        Thu, 19 Nov 2026 21:28:25 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm1289912b6e.9.2026.11.19.21.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:28:24 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] pfkey: fix kernel stack leak in pfkey_migrate()
Date: Fri, 20 Nov 2026 13:28:14 +0800
Message-ID: <20261120052814.3686573-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

pfkey_migrate() declares struct xfrm_migrate m[XFRM_MAX_DEPTH] on the
stack without initializing it. For AF_INET endpoints
pfkey_sockaddr_extract() writes only the 4-byte a4 member, leaving
the remaining 12 bytes of each xfrm_address_t as stack residue.
xfrm_state_clone_and_setup() then memcpy()s the full 16-byte
new_daddr and new_saddr into the cloned xfrm_state, and a subsequent
XFRM_MSG_GETSA dump copies them back to userspace as-is. Each
migrated SA leaks 24 bytes of kernel stack, which can contain kernel
pointers. The same uninitialized bytes also feed the 16-byte memcmp()
in xfrm_migrate_check(), making duplicate detection unreliable.

Zero-initialize the array, as xfrm_do_migrate() in xfrm_user.c
already does.

This issue was discovered by Tencent CodeBuddy Security.
Cc: stable@vger.kernel.org
Fixes: 08de61beab8a ("[PFKEYV2]: Extension for dynamic update of endpoint address(es)")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/key/af_key.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/key/af_key.c b/net/key/af_key.c
index d215b33b7492..6d116862b20d 100644
--- a/net/key/af_key.c
+++ b/net/key/af_key.c
@@ -2571,7 +2571,7 @@ static int pfkey_migrate(struct sock *sk, struct sk_buff *skb,
 	struct sadb_x_policy *pol;
 	struct sadb_x_ipsecrequest *rq;
 	struct xfrm_selector sel;
-	struct xfrm_migrate m[XFRM_MAX_DEPTH];
+	struct xfrm_migrate m[XFRM_MAX_DEPTH] = {};
 	struct xfrm_kmaddress k;
 	struct net *net = sock_net(sk);
 
-- 
2.43.7

