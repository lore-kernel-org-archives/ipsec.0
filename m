Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792738690;
	b=3n6pOXaXHCvEcyoi0zCzOvqJDjZYvfOMTWPy0gOcUCtIaIPDAivohW4RYf2DWx1cFSJb
	 15EWBeXa0VrZitspvt4GhiY1Kbgh5PeuGiaZ3hJjPGij3834lQYQFAHoB3CKFVBujQGZb
	 8/1I00lU9QJdSJ8ikeruH84fiAbEIJjiKtlCMHw38DR2YBlIN6PT/T9Pmp+OkTHqbj84Y
	 i+2dSC0Y2A/mO5/7Kui7Sw2MsjdUwWauirSVR3aML3xN3yjwDWOy1DhAZThCEVsRFs0wt
	 WIJ/wX/raaAu5jmpvbKFXSK9kNmE1qMIt0sRNaDZH92FG1SSBAAKD2TTBy1BBlNsPPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=ZsUNjtEj4RUe68Fi2odqN0bFEItXBMJkpeS0oj9PhNc=;
	b=dvjR5VO4sZzvLDADDbgj673RFGrOHfQh4UGUJpyxY/dPU9rJAB9+NvTdEBWMy6RLlikH
	 pvKtsKQPPZWsmuC6r4rR4sAZbDzXZVDXMDD1JYaAlB0iHcmqG+iNApDj34DeYHGt4qZQ/
	 UcrZmF8ZmBXhMQMXd7yXvrLKYxsEZy46Vh4/bU/r99MpmTLwjK6oxnp8071ghrLsQ+Df7
	 aH72IuyZ/mz1Tciotn9KtHSP+rx7OvlJfPOimCblihUNLVuGQIDLIK1DrlRYsiIzKHibm
	 ug8V0gGiPU3mnsBxSm1JKO4zq9i7v4RQGigDCHM3sg+JFr/CjT/pr4km2WykEvrShOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=iCx9mpMh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DBA606A31E
	for <ipsec@lists.linux.dev>; Fri, 23 Oct 2026 06:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DBA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=iCx9mpMh
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-43bf9548df4so474127fac.0
        for <ipsec@lists.linux.dev>; Thu, 22 Oct 2026 23:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792738688; cv=none;
        d=google.com; s=arc-20260327;
        b=PexmxPuLm+rOPOI3/oFFXk1sk3HEjEHyJ8MmbffcewM4X8zV7QR1ErXjv7dIDO1UEc
         XqQKmhMGYpyotxNhL5Gyyu86bEwxFeyU+E5nAySpDHdbImsIwkiSZFAqjXuUlvPsE9dw
         yi1s5E3ZkNhBebjOgZI96L3sSfLXdC5WV1WfZmHYeq33wd1PBmlyZCnSjy7gzRjN/Mur
         VMg5OdpADPt+OtIoHLIpu2EH+7OMmLJyUXfApgaESob2bmDOFBeaNJFjHS0TDj6XUli0
         cG+Q2bQBsVuAj3XoAahUZb35l835Rj3gDWtYPl+FaHqkPey5VZrc3uKYGf6C2q5YKzk/
         XZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZsUNjtEj4RUe68Fi2odqN0bFEItXBMJkpeS0oj9PhNc=;
        fh=E/a5c8uavRE8xl5fmfnBoX6F8GHf2RAJNrpju3F61bk=;
        b=Bp3j3m8JDP7UHGje/RjbjDvOd+Ks9he8gArCLqn2ftGTU+pIW5TX88x2/hGpNynIYS
         3zL4fznEaUwfd9gwJVI2jrJ7r9EfSHj8ld3z2zzWks1QLHRJzUGJEXLbvnD4ZFDTBDgJ
         trsIcU899f38uy8PzvSO66SPwY/hqXF5uUL3R/5cnbXM0yG3kKNT6D530mq98VaSXuBJ
         Uzk8X9bMIb0nCORiVdXoZGRcJcKajqXZSpDQokPrhhpNh1k8C4FryGyezEwmrjkGlgd/
         lQSsjils/FUUrXZBBpZr7J6Qr8eojzP55MltQvVDgsrUe9yS/P9EhfkisMhdJgZMJsW9
         aJTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792738688; x=1793343488; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZsUNjtEj4RUe68Fi2odqN0bFEItXBMJkpeS0oj9PhNc=;
        b=iCx9mpMhXdMgjLVe4/5u0GwX1OZ783r3Idbqn2gj/iKpQh9b34xe34u1iUsIS8qQdY
         fpHG1jv7pJ+j9Vf/BSkGOxJwFhwr0KpzDEZ99gQAZ6TBPSlS1fqc2s5bj3kNAXiGLpIS
         TrguDf4DtnLZNiOmQsNfPxVMV7/dSakY9U1xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738688; x=1793343488;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsUNjtEj4RUe68Fi2odqN0bFEItXBMJkpeS0oj9PhNc=;
        b=dCKVnb/SMpotApxGFr7QqR7SaLRJ35Lk+VwYGlQfP8GFh+pPFK1XPUp2IzPqDdUWUb
         igy+b1kwlBauRZt5mPBEjwgqU4KsGevcWTvd3QcwgkLFNei8c1nmsTJ61aN1f0a/R2zi
         BX7zn8TRPuk0vxFJcbXLQRRnmqCllo4DfE5JscxWwM0hG2ba0MylH4aFeabXSmqPuHb/
         o9GKAPjwubAkRqL7LzMC+F2APVZSGwgxa79j2ZOdhPa5023kBxAxwjj8Ns30ACnzK+KZ
         4ZvGnTdNDM7Mb9Hg6lkZRwDPJofIH2AQADgOSpvmo3n+cmFaaB3kvisU++QE8ARRfpgc
         9VMg==
X-Gm-Message-State: AFq9FYJUvfLIVnEjuSi25gNTMKZG9gu5DybWf5Hdh1ewR7v7V1HnMeqm
	44kPbH7LQ2yxhPe+XNTSOOSQRB8Mn2oUeUJ6WKGEQLi/MvRJ6NpEaLADNuJ0UbyZgXgvgtTqvZ7
	r2umY/9QNjkKtG4SNVB0DV4trxsCuDnxJq8k99QSc95VXjdndrP0xlkpOKZNkn5A=
X-Gm-Gg: AYBFou0OdREC+x/S/1eczubJSlUiVo+2YIBHyEUyTzkKDPfv68i2Mo+fC6tb865DZZM
	0rzzMtB8vIXoQN8NeNqgfYtd/8iEb2Gl2lXEy433jZH6rwjvb0T3bzv7r6Uvxmb0f2kva+pQN1Z
	vgxpXfOVn7tHNBVp7+uvwbZv784p0CtmpXcGMKviA0Mp2aByKg5+TkWVgbGPlnywZ3SWO9QlCOu
	EMKReqDRYfuW1zG7ss2X/05COFX/7tT9NpLQyU9+8nXwwzA9wkeFRxtycuMR2X2gqSXLY0EDgNx
	ZAhBX4PC07OJfXPpvusBIIkzmWz4VtlpNgHS25S/jf09J5iV94rvxjHzedmxcCXqogKTcSxXpPg
	Fx9CIT7BxOwxzm1S4Qhi4iESk0NCbWCS02cbMCNghSJNqi47tcR1ITkBZKs9XnOXVncA=
X-Received: by 2002:a05:6808:1305:b0:4f4:f5b9:8c74 with SMTP id
 5614622812f47-55be7d39732mr996892b6e.0.1792738687944; Thu, 22 Oct 2026
 23:58:07 -0700 (PDT)
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Chris Hoy Poy <choypoy@linuxfoundation.org>
Date: Fri, 23 Oct 2026 14:57:55 +0800
X-Gm-Features: AclHuK_y_VHW5PcRDKEKXPMpkfSREVfBpFocm0PiPnCWd5MDevgFiZ30ag0s1Dc
Message-ID: <CAKkv+gzdpR8S64X6fhO5yBWSYcF=U4ydZZUZx3KvdU7_Fm6b4w@mail.gmail.com>
Subject: Delivery test - please ignore
To: ipsec@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is a test message to check delivery and start the archive for the
list. Please ignore.

Chris Hoy Poy
Senior Systems Engineer
Core Projects
The Linux Foundation
Perth, Western Australia (GMT:+8)
