<?xml version="1.0"?>
<!-- htmlmin:ignore -->
<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" version="2.0">
    <channel>
        <title>Bijou Banter</title>
        <link>http://bijou.uiowa.edu</link>
        <language>en-us</language>
        <copyright>Copyright Bijou</copyright>
        <itunes:subtitle>A weekly podcast discussing films and the film industry.</itunes:subtitle>
        <itunes:author>Bijou Film Board</itunes:author>
        <itunes:summary>The Bijou Film Board is a non-profit, student-run organization dedicated to showcasing independent, art house, foreign, and classic cinema.</itunes:summary>
        <description>The Bijou Film Board is a non-profit, student-run organization dedicated to showcasing independent, art house, foreign, and classic cinema.</description>
        <!-- <atom:link href="$Link" rel="self" type="application/rss+xml"/> -->
        <itunes:owner>
            <itunes:name>Bijou Banter</itunes:name>
            <itunes:email>bijouui.executive@gmail.com</itunes:email>
        </itunes:owner>
        <itunes:explicit>clean</itunes:explicit>
        <itunes:image href="http://bijou.uiowa.edu/assets/a11a564205/bijou-logo-album.jpg" />
        <itunes:category text="TV &amp; Film" />
        <% loop $Entries %>
        <% if $AudioClip %>
        <item>
            <id>$AudioClip.ID</id>
            <title>$Title.XML</title>
            <link>$AbsoluteLink</link>
            <% if $Description %>
            <description>$Description.CDATA</description>
            <% end_if %>
            <itunes:author>Bijou Film Board</itunes:author>
            <itunes:subtitle>$Description.Plain.LimitCharacters(180)</itunes:subtitle>
            <itunes:summary>$Description.Plain</itunes:summary>
            <enclosure url="$AudioClip.AbsoluteURL" length="0" type="audio/x-m4a" />
            <% if $Date %>
            <pubDate>$Date.Rfc822</pubDate>
            <% else %>
            <pubDate>$Created.Rfc822</pubDate>
            <% end_if %>
            <guid>$AbsoluteLink</guid>
        </item>
        <% end_if %>
        <% end_loop %>
    </channel>
</rss>
<!-- htmlmin:ignore -->
