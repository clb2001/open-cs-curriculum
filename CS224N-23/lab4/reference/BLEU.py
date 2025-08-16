# -*- coding: utf-8 -*-
# @author: caoyang
# @email: caoyang@163.sufe.edu.cn
# 计算BLEU指数

import numpy
from collections import Counter

def calc_bleu(nmt_translation, reference_translations, lambdas, k=4):
	# 权重系数的长度应当与ngram的最大长度相同
	assert len(lambdas) == k
	
	# 期望输入的是已经分好词的两个语句序列, 否则需要首先进行分词
	if isinstance(nmt_translation, str):
		nmt_translation = nmt_translation.split()
	for i in range(len(reference_translations)):
		if isinstance(reference_translations[i], str):
			reference_translations[i] = reference_translations[i].split()
		
	# 变量初始化
	nmt_ngram_counters = []							# 储存机器翻译序列的中所有的ngram短语, 并记录它们在机器翻译序列的中出现的次数
	reference_ngram_counters = []					# 储存机器翻译序列的中所有的ngram短语, 并记录它们在机器翻译序列的中出现的次数
	p_ns = []										# 储存所有p_n的取值
	length_nmt_translation = len(nmt_translation)	# 机器翻译序列的长度len(c)
	
	# 计算len(r)
	length_reference_translation_min = float('inf')				
	flag = float('inf')
	for reference_translation in reference_translations:
		length_reference_translation = len(reference_translation)
		error = abs(length_reference_translation - length_nmt_translation)
		if error <= flag and length_reference_translation <= length_reference_translation_min:
			length_reference_translation_min = length_reference_translation
			flag = error
	
	# 统计机器翻译序列中的ngram频次
	for n in range(k):
		ngrams = []
		for i in range(length_nmt_translation - n):
			ngrams.append(' '.join(nmt_translation[i:i + n + 1]))
		nmt_ngram_counters.append(dict(Counter(ngrams)))
	# print(nmt_ngram_counters)
	# print('-' * 64)
	
	# 统计标准翻译序列中的ngram频次
	for reference_translation in reference_translations:
		reference_ngram_counters.append([])
		for n in range(k):
			ngrams = []
			for i in range(len(reference_translation) - n):
				ngrams.append(' '.join(reference_translation[i:i + n + 1]))
			reference_ngram_counters[-1].append(dict(Counter(ngrams)))
	# print(reference_ngram_counters)
	# print('-' * 64)
	
	# 计算p_n
	for n in range(k):
		p_n_numerator = 0		# p_n的分子部分
		p_n_denominator = 0		# p_n的分母部分
		for ngram in nmt_ngram_counters[n]:
			p_n_numerator += min([max([reference_ngram_counters[i][n].get(ngram, 0) for i in range(len(reference_ngram_counters))]), nmt_ngram_counters[n][ngram]])
			p_n_denominator += nmt_ngram_counters[n][ngram]
		p_n = p_n_numerator / p_n_denominator
		p_ns.append(p_n)

	# 计算BP
	if length_nmt_translation > length_reference_translation_min:
		bp = 1
	else:
		bp = numpy.exp(1 - length_reference_translation_min / length_nmt_translation)

	# 计算BLEU
	bleu = bp * numpy.exp(sum([lambda_ * numpy.log(p_n) for lambda_, p_n in zip(lambdas, p_ns)]))
	return bleu

reference_translations = [
	'the light shines in the darkness and the darkness has not overcome it',
	'and the light shines in the darkness and the darkness did not comprehend it',
]

nmt_translations = [
	'and the light shines in the darkness and the darkness can not comprehend',
	'the light shines the darkness has not in the darkness and the trials',
]

for nmt_translation in nmt_translations:
	bleu = calc_bleu(nmt_translation=nmt_translation, 
					 reference_translations=reference_translations, 
					 lambdas=[.5, .5, .0, .0],
					 k=4)
	print(bleu)
