#!/usr/bin/perl

# This tells perl that I will be outputting HTML content
print "content-type: text/html \n\n";

print <<"EOF";
<HTML>
	<HEAD>
		<TITLE>Hello, world!</TITLE>
	</HEAD>

	<BODY>
		<h1>This is a title... Hello!</h1>
		<p>
			Para para paragraaaaap
			Par par par par paragraphhhhh
		</p>

		<br>

		<p>
			Paring down the paragraphs
			Is essential in your epitaph
		</p>
	</BODY>
</HTML>
EOF
