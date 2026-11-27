Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755498;
	b=BGwJJNIxMNixPCZjvoWCwT6l7EG+kzzY4MuoDJDyL9Gmn+lqrXTVgmQ/6osikYjzVKqf
	 IiR+/Jt/5lCPjSfEFjpyZ2wGIRErHt8jpKY2mx9xEMIvuf4wf9XHygUbRmqu2WOvxSr6n
	 6MepMaXfJi+DVPsTRJDWrNv4pmnAdj/rOaoba2Q2Hz9+nvd6SeR2SDLRnRoGKAVQ5/nsh
	 HRBKwi/pNjmh+t65AlwC5t3+LIyWoYriAI7rF2wRHgRho4IAESS1cYCIfodtlsP4vO/bb
	 ua94aEjKW2CSBeb1ayc4MhVD+d/bAQhUvZypoOg5yf1Raio4JHgG1rakc72gcdBZ2yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M7vTOR3oemTA1W0hJKqVqhgWngwg5/C2IpV/104sVMI=;
	b=5IrsZKQWzuSRAgVSseAiuODAZFMgelyDjciyu5QcAGpcAhSvhMrzwYb1hMfFQ8g9V+o+
	 ucyQK9Hw4upVmS9dcxS9v8Gax/UQja+ttb+5DbSRUOJViLxr3BnsPSa0QekZjF/BztDCq
	 ZGlv7UcKViaQoHjBO14zY1rcDyF2LRdMZFyJZAuXUlwGn+j41BJtWpbCsBJ0iDjdT8itI
	 eO5ojenzQcCPjCVojzQrKDSzExIPxBmBzK3VuyYSByAb4Yn5SFO48lH+S90EqS2WnETcD
	 yRm/QECbwXqjLXVtMc3xYISRgoLUpyLSi48vvec1NFYZ3+60sZD8eClx+oFEXC9EO2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVoQ3rPW;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F7B606A321
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 04:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F7B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVoQ3rPW
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cddac941ed1so3438287a12.2
        for <ipsec@lists.linux.dev>; Thu, 26 Nov 2026 20:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795755497; x=1796360297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7vTOR3oemTA1W0hJKqVqhgWngwg5/C2IpV/104sVMI=;
        b=FVoQ3rPWZAsX0xrpI/d3OVXLBw49rnzlFrTI0tG1Li+4VEKjZ7Rp1iFrbhbhbfyiNV
         VaHwVJQea0vV51OzcK1lJ2qSb+6/pTW4Tmgpb5Fb4LKAbpy61g4LPnjKKLpklgWApUR1
         yEEizkH8xNQHXSeggEFxYGo6+c+Wbi1KbjNPyFT+ZKNRqZMfpdm6KwA+V8DiPkaPSdpP
         G4NfA9ltLeS25ivHTbPENinz98TouDPe3WMf8gUOqIXxVj/ZEfqZ3hDi2J1lVoCD2+dz
         +pSg80cwJhe5gWHuruHkyb0nWpP6h8/INWQuPzz/UsjSlb0LJw3jCBDg+hSEPlq6DtPy
         TbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795755497; x=1796360297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7vTOR3oemTA1W0hJKqVqhgWngwg5/C2IpV/104sVMI=;
        b=jKOZZMwSqzHbRPVzx8EZuPjbAC9gr26UOuNkDe0QhJj01DTuUsNtwAgHgL5o/E3NyF
         e6GJPHuB9vtHRMxsj2waFTQipWldU3amWu2BA+PUWfBgZNzFLNRG4KA7G8o3wXQUyOLl
         JOgWiffgnocrw8cmgLtp42OegcfJNLyXdlzHfjOI1A4nQyzlXWD9Xs2i3KgUD4k/tl89
         OoWFXdIcUhsZogG+hzkYOBXXmhYfAbiZJr8Li9A6+P8VH2I9T00eMvlXCGDpO8APhy7Z
         bumP7+Qst8a9axGrXSog5w6gy60Zt4SrxVfz89UnAsBZyI2vEIlAK2BlPyEZ+CTgh142
         teew==
X-Forwarded-Encrypted: i=1; AL+hErGH1xLaATwZgoPRN8nFRR8N9bfBG3+7sumUAVcFtJOWk5IttrmPdlffJ3lpdkTSUhcx9eAjWg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Uk9Du2YQkaC5tFoEQQ6WK0A8wmc0muvGOTIBHOR7JBV2ZUNGD
	TJwAxV0CNCk51/AVrhJN5/p5a8FL6LeiThHjgYEA6k9NpGSefI0qNxnP
X-Gm-Gg: AZFdTZebxj87ISIIp3DBrhXkSlv0PoNo150QI2J0dQMc76qGTxIPRVY8Tx4eh3W3mjf
	6OL6k9DmHlv738LVQE5ZJs2Hj7wDbiCqfTyYwMxbuXpEUitfqUf9w+JNExHiAWllhVvSsCTrEzz
	HrwtHaPWDG4hw30pAjMHMKBSEN2yMheIxO5ykk3jRrMaspCp48r/fYaW0yqh0WFat6a7xJnn/TT
	Bx3KKheLYYa4XS5moN/p4rN12r7BibT3qS30FlT6P5qsAvNNTH16oxIJx48yReu9nWE2whGH217
	u+J7kDnQ4vC37aXNZSSktqo+1W7So5vG4QCCBjjlhuJLR/xcAFOyfLu6S5ph1sI5gmDldz5BEuD
	QCcThb+W0VCVbQCMZLs3ab+GxJqx0LjBnCi18hVpk9nKxSGLnoQU1QoecGmEsduEFNFeWtde84G
	yDq5Nq+lzS0Y4Qd9uAc1bT5NVZlvn93IDpQrc1DVTed22iuIRh+ur9kDRNUeUfGevSDGWnENSx7
	5QnqzzxySSD/tdCGGw4pgxJxrthMh+143wY/Z9mXfZaYGeIU4A8HogGKvoIz/SGg6ZUusgL/CeW
	FBWW4kUI+EZPuQnQYYJfTQr/vllw5HgJXcawkvFPrvb8D8BZmDF9drqMNpJFgKsnLMA=
X-Received: by 2002:a17:90b:2e8c:b0:3ad:d4aa:8559 with SMTP id 98e67ed59e1d1-3b41c8e105bmr19924654a91.17.1795755497037;
        Thu, 26 Nov 2026 20:58:17 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm39010808a91.12.2026.11.26.20.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:58:16 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v3] net: free the socket policies when sk_clone() fails
Date: Fri, 27 Nov 2026 13:58:10 +0900
Message-ID: <179568863376.462699.9896914557163021386@gmail.com>
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

sk_clone() clones the parent's socket policies with
xfrm_sk_clone_policy() and then its BPF socket storage with
bpf_sk_storage_clone(). If either fails once a policy has been cloned,
the new socket goes to the "free" label, which only clears sk_destruct
and calls sk_free(), as the socket is still a raw copy of the parent.
Nothing frees the cloned policies: they stay on the namespace's policy
list and in its count, and the namespace teardown warns in
xfrm_policy_fini().

__xfrm_sk_clone_policy() fails that way when cloning the second policy
fails, with the clone of the first already in the new socket.
bpf_sk_storage_clone() fails when memory is short or when the copy does
not fit into net.core.optmem_max.

Free the policies in a new label at the end of the function. A failed
filter charge still goes to the old one: xfrm_sk_clone_policy() has not
run then, and sk_policy[] still holds the parent's pointers.

Fixes: d188ba86dd07 ("xfrm: add rcu protection to sk->sk_policy[]")
Fixes: 8f51dfc73bf1 ("bpf: support cloning sk storage on accept()")
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
v3:
- Free the policies at the end of sk_clone() instead of in
  __xfrm_sk_clone_policy(), so there is no unwind loop (Steffen), and a
  later failure of bpf_sk_storage_clone() is covered too (the AI review
  Steffen forwarded). This is the unwind Jakub asked for on Josef's
  patch for the second case:
  https://lore.kernel.org/all/20261020192044.7c3a58a1@kernel.org/
- Hence the new subject; nothing in net/xfrm/ changes any more.
v2: https://lore.kernel.org/all/179540803323.3139700.5340002553684152759@gmail.com/
v1: https://lore.kernel.org/netdev/179505710269.3511679.8893709762919027206@gmail.com/

Both cases reproduce as root in a new network namespace with a loopback
TCP listener that has IP_XFRM_POLICY set in both directions. For the
first, failslab fails the second clone_policy() (a stack filter on
__xfrm_sk_clone_policy() and interval 2). For the second, the listener
also gets an element of a BPF_F_CLONE sk_storage map, and
net.core.optmem_max is then lowered so that the child's copy cannot be
charged. Without the patch, the clones are left behind and the
namespace teardown warns in xfrm_policy_fini(); with it, it does not.

The patch was written with LLM assistance; we reviewed and tested it.

 net/core/sock.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 5675053625e6..d291433749d2 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2598,19 +2598,20 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
 	RCU_INIT_POINTER(newsk->sk_filter, filter);
 	rcu_read_unlock();
 
-	if (unlikely(!is_charged || xfrm_sk_clone_policy(newsk, sk))) {
+	if (unlikely(!is_charged)) {
 		/* We need to make sure that we don't uncharge the new
 		 * socket if we couldn't charge it in the first place
 		 * as otherwise we uncharge the parent's filter.
 		 */
-		if (!is_charged)
-			RCU_INIT_POINTER(newsk->sk_filter, NULL);
-
+		RCU_INIT_POINTER(newsk->sk_filter, NULL);
 		goto free;
 	}
 
+	if (unlikely(xfrm_sk_clone_policy(newsk, sk)))
+		goto free_policy;
+
 	if (bpf_sk_storage_clone(sk, newsk))
-		goto free;
+		goto free_policy;
 
 	/* Clear sk_user_data if parent had the pointer tagged
 	 * as not suitable for copying when cloning.
@@ -2638,6 +2639,8 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
 		sk_sockets_allocated_inc(newsk);
 out:
 	return newsk;
+free_policy:
+	xfrm_sk_free_policy(newsk);
 free:
 	/* It is still raw copy of parent, so invalidate
 	 * destructor and make plain sk_free()
-- 
2.43.0

