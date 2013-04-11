miRNA-target(jiandanhash).rb与miRNA-target(fuzahash).rb与miRNA-target(hanghangdu).rb
	三个程序实现相同功能，输出结果一样
	不同的是：
		miRNA-target(jiandanhash).rb VS miRNA-target(fuzahash).rb
			前者多使用一层hash，但将hash问题简化了
			而后者少用一层hash，但将hash问题复杂化(可用于解决复杂hash嵌套问题)
		miRNA-target(jiandanhash).rb VS miRNA-target(hanghangdu).rb
			前者先读取整个文件,再切割并操作,(特点是：耗内存省时间,若文件太大,程序会崩掉)
			而后者则一行一行读取文件，每读一行就进行切割并操作(特点是：省内存耗时间,若文件太大,程序可能不会崩掉,但时间必定超级超级长)
	
miRNA-target(more-file-hash-long).rb与miRNA-target(more-file-hash-short).rb
	两个程序实现相同功能，输出结果一样
	不同的是,"miRNA-target(more-file-hash-long).rb"中有多段代码几乎一样，只是输入不同，
	因此将这段代码写成子函数，只要多次调用此函数便成，由此得"miRNA-target(more-file-hash-short).rb"
