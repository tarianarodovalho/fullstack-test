defmodule InsideTrading.EDGARParserFixtures do
  @moduledoc """
  This module defines test helpers for creating
  response bodies to be used in EDGARParser tests.
  """

  @doc """
  Generate the response body for fetched latest filings list.
  """
  def successful_latest_filings_fixture(_attrs \\ %{}) do
    """
    <?xml version="1.0" encoding="ISO-8859-1" ?>
    <feed xmlns="http://www.w3.org/2005/Atom">
    <title>Latest Filings - Fri, 17 May 2024 22:47:51 EDT</title>
    <link rel="alternate" href="/cgi-bin/browse-edgar?action=getcurrent"/>
    <link rel="self" href="/cgi-bin/browse-edgar?action=getcurrent"/>
    <id>https://www.sec.gov/cgi-bin/browse-edgar?action=getcurrent</id>
    <author><name>Webmaster</name><email>webmaster@sec.gov</email></author>
    <updated>2024-05-17T22:47:51-04:00</updated>
    <entry>
    <title>4 - Guttman-McCabe Christopher (0001828490) (Reporting)</title>
    <link rel="alternate" type="text/html" href="https://www.sec.gov/Archives/edgar/data/1828490/000130449224000054/0001304492-24-000054-index.htm"/>
    <summary type="html">
    &lt;b&gt;Filed:&lt;/b&gt; 2024-05-17 &lt;b&gt;AccNo:&lt;/b&gt; 0001304492-24-000054 &lt;b&gt;Size:&lt;/b&gt; 5 KB
    </summary>
    <updated>2024-05-17T21:59:48-04:00</updated>
    <category scheme="https://www.sec.gov/" label="form type" term="4"/>
    <id>urn:tag:sec.gov,2008:accession-number=0001304492-24-000054</id>
    </entry>
    <entry>
    <title>4 - Anterix Inc. (0001304492) (Issuer)</title>
    <link rel="alternate" type="text/html" href="https://www.sec.gov/Archives/edgar/data/1304492/000130449224000054/0001304492-24-000054-index.htm"/>
    <summary type="html">
    &lt;b&gt;Filed:&lt;/b&gt; 2024-05-17 &lt;b&gt;AccNo:&lt;/b&gt; 0001304492-24-000054 &lt;b&gt;Size:&lt;/b&gt; 5 KB
    </summary>
    <updated>2024-05-17T21:59:48-04:00</updated>
    <category scheme="https://www.sec.gov/" label="form type" term="4"/>
    <id>urn:tag:sec.gov,2008:accession-number=0001304492-24-000054</id>
    </entry>
    <entry>
    <title>4 - Gerbrandt Ryan (0001821509) (Reporting)</title>
    <link rel="alternate" type="text/html" href="https://www.sec.gov/Archives/edgar/data/1821509/000130449224000053/0001304492-24-000053-index.htm"/>
    <summary type="html">
    &lt;b&gt;Filed:&lt;/b&gt; 2024-05-17 &lt;b&gt;AccNo:&lt;/b&gt; 0001304492-24-000053 &lt;b&gt;Size:&lt;/b&gt; 5 KB
    </summary>
    <updated>2024-05-17T21:59:25-04:00</updated>
    <category scheme="https://www.sec.gov/" label="form type" term="4"/>
    <id>urn:tag:sec.gov,2008:accession-number=0001304492-24-000053</id>
    </entry>
    <entry>
    <title>4 - Anterix Inc. (0001304492) (Issuer)</title>
    <link rel="alternate" type="text/html" href="https://www.sec.gov/Archives/edgar/data/1304492/000130449224000053/0001304492-24-000053-index.htm"/>
    <summary type="html">
    &lt;b&gt;Filed:&lt;/b&gt; 2024-05-17 &lt;b&gt;AccNo:&lt;/b&gt; 0001304492-24-000053 &lt;b&gt;Size:&lt;/b&gt; 5 KB
    </summary>
    <updated>2024-05-17T21:59:25-04:00</updated>
    <category scheme="https://www.sec.gov/" label="form type" term="4"/>
    <id>urn:tag:sec.gov,2008:accession-number=0001304492-24-000053</id>
    </entry>
    <entry>
    <title>4 - Ashe Gena L (0001669943) (Reporting)</title>
    <link rel="alternate" type="text/html" href="https://www.sec.gov/Archives/edgar/data/1669943/000130449224000051/0001304492-24-000051-index.htm"/>
    <summary type="html">
    &lt;b&gt;Filed:&lt;/b&gt; 2024-05-17 &lt;b&gt;AccNo:&lt;/b&gt; 0001304492-24-000051 &lt;b&gt;Size:&lt;/b&gt; 5 KB
    </summary>
    <updated>2024-05-17T21:58:43-04:00</updated>
    <category scheme="https://www.sec.gov/" label="form type" term="4"/>
    <id>urn:tag:sec.gov,2008:accession-number=0001304492-24-000051</id>
    </entry>
    <entry>
    <title>4 - Anterix Inc. (0001304492) (Issuer)</title>
    <link rel="alternate" type="text/html" href="https://www.sec.gov/Archives/edgar/data/1304492/000130449224000051/0001304492-24-000051-index.htm"/>
    <summary type="html">
    &lt;b&gt;Filed:&lt;/b&gt; 2024-05-17 &lt;b&gt;AccNo:&lt;/b&gt; 0001304492-24-000051 &lt;b&gt;Size:&lt;/b&gt; 5 KB
    </summary>
    <updated>2024-05-17T21:58:43-04:00</updated>
    <category scheme="https://www.sec.gov/" label="form type" term="4"/>
    <id>urn:tag:sec.gov,2008:accession-number=0001304492-24-000051</id>
    </entry>
    <entry>
    <title>4 - Gritstone bio, Inc. (0001656634) (Issuer)</title>
    <link rel="alternate" type="text/html" href="https://www.sec.gov/Archives/edgar/data/1656634/000141588924013657/0001415889-24-013657-index.htm"/>
    <summary type="html">
    &lt;b&gt;Filed:&lt;/b&gt; 2024-05-17 &lt;b&gt;AccNo:&lt;/b&gt; 0001415889-24-013657 &lt;b&gt;Size:&lt;/b&gt; 11 KB
    </summary>
    <updated>2024-05-17T21:58:30-04:00</updated>
    <category scheme="https://www.sec.gov/" label="form type" term="4"/>
    <id>urn:tag:sec.gov,2008:accession-number=0001415889-24-013657</id>
    </entry>
    <entry>
    <title>4 - Allen Andrew R (0001374539) (Reporting)</title>
    <link rel="alternate" type="text/html" href="https://www.sec.gov/Archives/edgar/data/1374539/000141588924013657/0001415889-24-013657-index.htm"/>
    <summary type="html">
    &lt;b&gt;Filed:&lt;/b&gt; 2024-05-17 &lt;b&gt;AccNo:&lt;/b&gt; 0001415889-24-013657 &lt;b&gt;Size:&lt;/b&gt; 11 KB
    </summary>
    <updated>2024-05-17T21:58:30-04:00</updated>
    <category scheme="https://www.sec.gov/" label="form type" term="4"/>
    <id>urn:tag:sec.gov,2008:accession-number=0001415889-24-013657</id>
    </entry>
    <entry>
    <title>4 - Gray Timothy (0001629762) (Reporting)</title>
    <link rel="alternate" type="text/html" href="https://www.sec.gov/Archives/edgar/data/1629762/000130449224000050/0001304492-24-000050-index.htm"/>
    <summary type="html">
    &lt;b&gt;Filed:&lt;/b&gt; 2024-05-17 &lt;b&gt;AccNo:&lt;/b&gt; 0001304492-24-000050 &lt;b&gt;Size:&lt;/b&gt; 5 KB
    </summary>
    <updated>2024-05-17T21:58:13-04:00</updated>
    <category scheme="https://www.sec.gov/" label="form type" term="4"/>
    <id>urn:tag:sec.gov,2008:accession-number=0001304492-24-000050</id>
    </entry>
    <entry>
    <title>4 - Anterix Inc. (0001304492) (Issuer)</title>
    <link rel="alternate" type="text/html" href="https://www.sec.gov/Archives/edgar/data/1304492/000130449224000050/0001304492-24-000050-index.htm"/>
    <summary type="html">
    &lt;b&gt;Filed:&lt;/b&gt; 2024-05-17 &lt;b&gt;AccNo:&lt;/b&gt; 0001304492-24-000050 &lt;b&gt;Size:&lt;/b&gt; 5 KB
    </summary>
    <updated>2024-05-17T21:58:13-04:00</updated>
    <category scheme="https://www.sec.gov/" label="form type" term="4"/>
    <id>urn:tag:sec.gov,2008:accession-number=0001304492-24-000050</id>
    </entry>
    </feed>
    """
  end

  def failure_to_find_entries_fixture(_attrs \\ %{}) do
    """
    <?xml version="1.0" encoding="ISO-8859-1" ?>
    <feed xmlns="http://www.w3.org/2005/Atom">
    <title>Latest Filings - Fri, 17 May 2024 22:47:51 EDT</title>
    <link rel="alternate" href="/cgi-bin/browse-edgar?action=getcurrent"/>
    <link rel="self" href="/cgi-bin/browse-edgar?action=getcurrent"/>
    <id>https://www.sec.gov/cgi-bin/browse-edgar?action=getcurrent</id>
    <author><name>Webmaster</name><email>webmaster@sec.gov</email></author>
    <updated>2024-05-17T22:47:51-04:00</updated>
    </feed>
    """
  end

  def fatal_error_latest_filings_fixture(_attrs \\ %{}) do
    """
    """
  end

  @doc """
  Generate the response body for the filing details page.
  """
  def successful_details_page_fixture(_attrs \\ %{}) do
    """
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Last-Modified" content="Sat, 18 May 2024 00:24:09 GMT" />
    <title>EDGAR Filing Documents for 0001062993-24-010733</title>
    <link rel="stylesheet" type="text/css" href="/include/interactive.css" />
    </head>
    <body style="margin: 0">
    <!-- SEC Web Analytics - For information please visit: https://www.sec.gov/privacy.htm#collectedinfo -->
    <noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-TD3BKV"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    '//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-TD3BKV');</script>
    <!-- End SEC Web Analytics -->
    <noscript><div style="color:red; font-weight:bold; text-align:center;">This page uses Javascript. Your browser either doesn't support Javascript or you have it turned off. To see this page as it is meant to appear please use a Javascript enabled browser.</div></noscript>
    <!-- BEGIN BANNER -->
    <div id="headerTop">
       <div id="Nav"><a href="/index.htm">Home</a> | <a href="/cgi-bin/browse-edgar?action=getcurrent">Latest Filings</a> | <a href="javascript:history.back()">Previous Page</a></div>
       <div id="seal"><a href="/index.htm"><img src="/images/sealTop.gif" alt="SEC Seal" border="0" /></a></div>
       <div id="secWordGraphic"><img src="/images/bannerTitle.gif" alt="SEC Banner" /></div>
    </div>
    <div id="headerBottom">
       <div id="searchHome"><a href="/edgar/searchedgar/webusers.htm">Search the Next-Generation EDGAR System</a></div>
       <div id="PageTitle">Filing Detail</div>
    </div>
    <!-- END BANNER -->


    <!-- BEGIN BREADCRUMBS -->
    <div id="breadCrumbs">
       <ul>
          <li><a href="/index.htm">SEC Home</a> &#187;</li>
          <li><a href="/edgar/searchedgar/webusers.htm">Search the Next-Generation EDGAR System</a> &#187;</li>
          <li><a href="/edgar/searchedgar/companysearch.html">Company Search</a> &#187;</li>
          <li class="last">Current Page</li>
       </ul>
    </div>
    <!-- END BREADCRUMBS -->

    <div id="contentDiv">
    <!-- START FILING DIV -->
    <div id="formDiv">
       <div id="formHeader">
          <div id="formName">
             <strong>Form 4</strong> - Statement of changes in beneficial ownership of securities:
          </div>
          <div id="secNum">
             <strong><acronym title="Securities and Exchange Commission">SEC</acronym> Accession <acronym title="Number">No.</acronym></strong> 0001062993-24-010733
          </div>
       </div>
       <div class="formContent">

          <div class="formGrouping">
             <div class="infoHead">Filing Date</div>
             <div class="info">2024-05-17</div>
             <div class="infoHead">Accepted</div>
             <div class="info">2024-05-17 20:24:09</div>
             <div class="infoHead">Documents</div>
             <div class="info">1</div>
          </div>
          <div class="formGrouping">
             <div class="infoHead">Period of Report</div>
             <div class="info">2024-05-15</div>
          </div>
          <div style="clear:both"></div>
       </div>
    </div>
    <!-- END FILING DIV -->
    <!-- START DOCUMENT DIV -->
    <div id="formDiv">
       <div style="padding: 0px 0px 4px 0px; font-size: 12px; margin: 0px 2px 0px 5px; width: 100%; overflow:hidden">
          <p>Document Format Files</p>
          <table class="tableFile" summary="Document Format Files">
             <tr>
                <th scope="col" style="width: 5%;"><acronym title="Sequence Number">Seq</acronym></th>
                <th scope="col" style="width: 40%;">Description</th>
                <th scope="col" style="width: 20%;">Document</th>
                <th scope="col" style="width: 10%;">Type</th>
                <th scope="col">Size</th>
             </tr>
             <tr>
                <td scope="row">1</td>
                <td scope="row">STATEMENT OF CHANGES IN BENEFICIAL OWNERSHIP OF SECURITIES</td>
                <td scope="row"><a href="/Archives/edgar/data/1289419/000106299324010733/xslF345X05/form4.xml">form4.html</a></td>
                <td scope="row">4</td>
                <td scope="row">&nbsp;</td>
             </tr>
             <tr class="blueRow">
                <td scope="row">1</td>
                <td scope="row">STATEMENT OF CHANGES IN BENEFICIAL OWNERSHIP OF SECURITIES</td>
                <td scope="row"><a href="/Archives/edgar/data/1289419/000106299324010733/form4.xml">form4.xml</a></td>
                <td scope="row">4</td>
                <td scope="row">17631</td>
             </tr>
             <tr>
                <td scope="row">&nbsp;</td>
                <td scope="row">Complete submission text file</td>
                <td scope="row"><a href="/Archives/edgar/data/1289419/000106299324010733/0001062993-24-010733.txt">0001062993-24-010733.txt</a></td>
                <td scope="row">&nbsp;</td>
                <td scope="row">19083</td>
             </tr>
          </table>
       </div>
    </div>
    <!-- END DOCUMENT DIV -->
    <!-- START FILER DIV -->
    <div id="filerDiv">
       <div class="mailer">Mailing Address
          <span class="mailerAddress">22 WEST WASHINGTON STREET</span>
          <span class="mailerAddress">
    CHICAGO IL 60602      </span>
       </div>
       <div class="mailer">Business Address
          <span class="mailerAddress">22 WEST WASHINGTON STREET</span>
          <span class="mailerAddress">
    CHICAGO IL 60602      </span>
          <span class="mailerAddress">(312) 696-6000</span>
       </div>
    <div class="companyInfo">
      <span class="companyName">Morningstar, Inc. (<a href="/cgi-bin/own-disp?CIK=0001289419&amp;action=getissuer">Issuer</a>)
     <acronym title="Central Index Key">CIK</acronym>: <a href="/cgi-bin/browse-edgar?CIK=0001289419&amp;action=getcompany">0001289419 (see all company filings)</a></span>
    <p class="identInfo"><acronym title="Internal Revenue Service Number">IRS No.</acronym>: <strong>363297908</strong> | State of Incorp.: <strong>IL</strong> | Fiscal Year End: <strong>1231</strong><br /><acronym title="Standard Industrial Code">SIC</acronym>: <b><a href="/cgi-bin/browse-edgar?action=getcompany&amp;SIC=6282&amp;owner=include">6282</a></b> Investment Advice<br />(CF Office: 02 Finance)</p>
    </div>
    <div class="clear"></div>
    </div>
    <div id="filerDiv">
       <div class="mailer">Mailing Address
          <span class="mailerAddress">C/O MORNINGSTAR, INC.</span>
          <span class="mailerAddress">225 WEST WACKER DRIVE</span>
          <span class="mailerAddress">
    CHICAGO IL 60606      </span>
       </div>
       <div class="mailer">Business Address
       </div>
    <div class="companyInfo">
      <span class="companyName">Mansueto Joseph D (<a href="/cgi-bin/own-disp?CIK=0001324069&amp;action=getowner">Reporting</a>)
     <acronym title="Central Index Key">CIK</acronym>: <a href="/cgi-bin/browse-edgar?CIK=0001324069&amp;action=getcompany">0001324069 (see all company filings)</a></span>
    <p class="identInfo">Type: <strong>4</strong> | Act: <strong>34</strong> | File No.: <a href="/cgi-bin/browse-edgar?filenum=000-51280&amp;action=getcompany"><strong>000-51280</strong></a> | Film No.: <strong>24962145</strong></p>
    </div>
    <div class="clear"></div>
    </div>
    <!-- END FILER DIV -->
    </div>
    """
  end

  def url_not_found_details_page_fixture(_attrs \\ %{}) do
    """
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Last-Modified" content="Sat, 18 May 2024 00:24:09 GMT" />
    <title>EDGAR Filing Documents for 0001062993-24-010733</title>
    <link rel="stylesheet" type="text/css" href="/include/interactive.css" />
    </head>
    <body style="margin: 0">
    <!-- SEC Web Analytics - For information please visit: https://www.sec.gov/privacy.htm#collectedinfo -->
    <noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-TD3BKV"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    '//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-TD3BKV');</script>
    <!-- End SEC Web Analytics -->
    <noscript><div style="color:red; font-weight:bold; text-align:center;">This page uses Javascript. Your browser either doesn't support Javascript or you have it turned off. To see this page as it is meant to appear please use a Javascript enabled browser.</div></noscript>
    <!-- BEGIN BANNER -->
    <div id="headerTop">
       <div id="Nav"><a href="/index.htm">Home</a> | <a href="/cgi-bin/browse-edgar?action=getcurrent">Latest Filings</a> | <a href="javascript:history.back()">Previous Page</a></div>
       <div id="seal"><a href="/index.htm"><img src="/images/sealTop.gif" alt="SEC Seal" border="0" /></a></div>
       <div id="secWordGraphic"><img src="/images/bannerTitle.gif" alt="SEC Banner" /></div>
    </div>
    <div id="headerBottom">
       <div id="searchHome"><a href="/edgar/searchedgar/webusers.htm">Search the Next-Generation EDGAR System</a></div>
       <div id="PageTitle">Filing Detail</div>
    </div>
    <!-- END BANNER -->


    <!-- BEGIN BREADCRUMBS -->
    <div id="breadCrumbs">
       <ul>
          <li><a href="/index.htm">SEC Home</a> &#187;</li>
          <li><a href="/edgar/searchedgar/webusers.htm">Search the Next-Generation EDGAR System</a> &#187;</li>
          <li><a href="/edgar/searchedgar/companysearch.html">Company Search</a> &#187;</li>
          <li class="last">Current Page</li>
       </ul>
    </div>
    <!-- END BREADCRUMBS -->

    <div id="contentDiv">
    <!-- START FILING DIV -->
    <div id="formDiv">
       <div id="formHeader">
          <div id="formName">
             <strong>Form 4</strong> - Statement of changes in beneficial ownership of securities:
          </div>
          <div id="secNum">
             <strong><acronym title="Securities and Exchange Commission">SEC</acronym> Accession <acronym title="Number">No.</acronym></strong> 0001062993-24-010733
          </div>
       </div>
       <div class="formContent">

          <div class="formGrouping">
             <div class="infoHead">Filing Date</div>
             <div class="info">2024-05-17</div>
             <div class="infoHead">Accepted</div>
             <div class="info">2024-05-17 20:24:09</div>
             <div class="infoHead">Documents</div>
             <div class="info">1</div>
          </div>
          <div class="formGrouping">
             <div class="infoHead">Period of Report</div>
             <div class="info">2024-05-15</div>
          </div>
          <div style="clear:both"></div>
       </div>
    </div>
    <!-- END FILING DIV -->
    <!-- START DOCUMENT DIV -->
    <div id="formDiv">
       <div style="padding: 0px 0px 4px 0px; font-size: 12px; margin: 0px 2px 0px 5px; width: 100%; overflow:hidden">
          <p>Document Format Files</p>
          <table class="tableFile" summary="Document Format Files">
             <tr>
                <th scope="col" style="width: 5%;"><acronym title="Sequence Number">Seq</acronym></th>
                <th scope="col" style="width: 40%;">Description</th>
                <th scope="col" style="width: 20%;">Document</th>
                <th scope="col" style="width: 10%;">Type</th>
                <th scope="col">Size</th>
             </tr>
             <tr>
                <td scope="row">1</td>
                <td scope="row">STATEMENT OF CHANGES IN BENEFICIAL OWNERSHIP OF SECURITIES</td>
                <td scope="row"><a href="/Archives/edgar/data/1289419/000106299324010733/xslF345X05/form4.xml">form4.html</a></td>
                <td scope="row">4</td>
                <td scope="row">&nbsp;</td>
             </tr>
             <tr class="blueRow">
                <td scope="row">1</td>
                <td scope="row">STATEMENT OF CHANGES IN BENEFICIAL OWNERSHIP OF SECURITIES</td>
                <td scope="row"><a href="/Archives/edgar/data/1289419/000106299324010733/form4.xml">form4.html</a></td>
                <td scope="row">4</td>
                <td scope="row">17631</td>
             </tr>
             <tr>
                <td scope="row">&nbsp;</td>
                <td scope="row">Complete submission text file</td>
                <td scope="row"><a href="/Archives/edgar/data/1289419/000106299324010733/0001062993-24-010733.txt">0001062993-24-010733.txt</a></td>
                <td scope="row">&nbsp;</td>
                <td scope="row">19083</td>
             </tr>
          </table>
       </div>
    </div>
    <!-- END DOCUMENT DIV -->
    <!-- START FILER DIV -->
    <div id="filerDiv">
       <div class="mailer">Mailing Address
          <span class="mailerAddress">22 WEST WASHINGTON STREET</span>
          <span class="mailerAddress">
    CHICAGO IL 60602      </span>
       </div>
       <div class="mailer">Business Address
          <span class="mailerAddress">22 WEST WASHINGTON STREET</span>
          <span class="mailerAddress">
    CHICAGO IL 60602      </span>
          <span class="mailerAddress">(312) 696-6000</span>
       </div>
    <div class="companyInfo">
      <span class="companyName">Morningstar, Inc. (<a href="/cgi-bin/own-disp?CIK=0001289419&amp;action=getissuer">Issuer</a>)
     <acronym title="Central Index Key">CIK</acronym>: <a href="/cgi-bin/browse-edgar?CIK=0001289419&amp;action=getcompany">0001289419 (see all company filings)</a></span>
    <p class="identInfo"><acronym title="Internal Revenue Service Number">IRS No.</acronym>: <strong>363297908</strong> | State of Incorp.: <strong>IL</strong> | Fiscal Year End: <strong>1231</strong><br /><acronym title="Standard Industrial Code">SIC</acronym>: <b><a href="/cgi-bin/browse-edgar?action=getcompany&amp;SIC=6282&amp;owner=include">6282</a></b> Investment Advice<br />(CF Office: 02 Finance)</p>
    </div>
    <div class="clear"></div>
    </div>
    <div id="filerDiv">
       <div class="mailer">Mailing Address
          <span class="mailerAddress">C/O MORNINGSTAR, INC.</span>
          <span class="mailerAddress">225 WEST WACKER DRIVE</span>
          <span class="mailerAddress">
    CHICAGO IL 60606      </span>
       </div>
       <div class="mailer">Business Address
       </div>
    <div class="companyInfo">
      <span class="companyName">Mansueto Joseph D (<a href="/cgi-bin/own-disp?CIK=0001324069&amp;action=getowner">Reporting</a>)
     <acronym title="Central Index Key">CIK</acronym>: <a href="/cgi-bin/browse-edgar?CIK=0001324069&amp;action=getcompany">0001324069 (see all company filings)</a></span>
    <p class="identInfo">Type: <strong>4</strong> | Act: <strong>34</strong> | File No.: <a href="/cgi-bin/browse-edgar?filenum=000-51280&amp;action=getcompany"><strong>000-51280</strong></a> | Film No.: <strong>24962145</strong></p>
    </div>
    <div class="clear"></div>
    </div>
    <!-- END FILER DIV -->
    </div>
    """
  end

  @doc """
  Generate the response body for the ownership document.
  """
  def ownership_document_fixture(_attrs \\ %{}) do
    """
    "<?xml version=\"1.0\"?>\n<ownershipDocument>\n\n    <schemaVersion>X0508</schemaVersion>\n\n    <documentType>4</documentType>\n\n    <periodOfReport>2024-05-15</periodOfReport>\n\n    <issuer>\n        <issuerCik>0001289419</issuerCik>\n        <issuerName>Morningstar, Inc.</issuerName>\n        <issuerTradingSymbol>MORN</issuerTradingSymbol>\n    </issuer>\n\n    <reportingOwner>\n        <reportingOwnerId>\n            <rptOwnerCik>0001324069</rptOwnerCik>\n            <rptOwnerName>Mansueto Joseph D</rptOwnerName>\n        </reportingOwnerId>\n        <reportingOwnerAddress>\n            <rptOwnerStreet1>22 W. WASHINGTON</rptOwnerStreet1>\n            <rptOwnerStreet2></rptOwnerStreet2>\n            <rptOwnerCity>CHICAGO</rptOwnerCity>\n            <rptOwnerState>IL</rptOwnerState>\n            <rptOwnerZipCode>60602</rptOwnerZipCode>\n            <rptOwnerStateDescription></rptOwnerStateDescription>\n        </reportingOwnerAddress>\n        <reportingOwnerRelationship>\n            <isDirector>1</isDirector>\n            <isOfficer>1</isOfficer>\n            <isTenPercentOwner>1</isTenPercentOwner>\n            <isOther>0</isOther>\n            <officerTitle>Executive Chairman</officerTitle>\n        </reportingOwnerRelationship>\n    </reportingOwner>\n\n    <aff10b5One>1</aff10b5One>\n\n    <nonDerivativeTable>\n        <nonDerivativeTransaction>\n            <securityTitle>\n                <value>Common Stock</value>\n            </securityTitle>\n            <transactionDate>\n                <value>2024-05-15</value>\n            </transactionDate>\n            <transactionCoding>\n                <transactionFormType>4</transactionFormType>\n                <transactionCode>S</transactionCode>\n                <equitySwapInvolved>0</equitySwapInvolved>\n                <footnoteId id=\"F1\"/>\n            </transactionCoding>\n            <transactionAmounts>\n                <transactionShares>\n                    <value>17</value>\n                </transactionShares>\n                <transactionPricePerShare>\n                    <value>297.2501</value>\n                </transactionPricePerShare>\n                <transactionAcquiredDisposedCode>\n                    <value>D</value>\n                </transactionAcquiredDisposedCode>\n            </transactionAmounts>\n            <postTransactionAmounts>\n                <sharesOwnedFollowingTransaction>\n                    <value>10708299</value>\n                </sharesOwnedFollowingTransaction>\n            </postTransactionAmounts>\n            <ownershipNature>\n                <directOrIndirectOwnership>\n                    <value>D</value>\n                </directOrIndirectOwnership>\n            </ownershipNature>\n        </nonDerivativeTransaction>\n        <nonDerivativeTransaction>\n            <securityTitle>\n                <value>Common Stock</value>\n            </securityTitle>\n            <transactionDate>\n                <value>2024-05-15</value>\n            </transactionDate>\n            <transactionCoding>\n                <transactionFormType>4</transactionFormType>\n                <transactionCode>S</transactionCode>\n                <equitySwapInvolved>0</equitySwapInvolved>\n                <footnoteId id=\"F1\"/>\n            </transactionCoding>\n            <transactionAmounts>\n                <transactionShares>\n                    <value>188</value>\n                </transactionShares>\n                <transactionPricePerShare>\n                    <value>298.7617</value>\n                    <footnoteId id=\"F2\"/>\n                </transactionPricePerShare>\n                <transactionAcquiredDisposedCode>\n                    <value>D</value>\n                </transactionAcquiredDisposedCode>\n            </transactionAmounts>\n            <postTransactionAmounts>\n                <sharesOwnedFollowingTransaction>\n                    <value>10708111</value>\n                </sharesOwnedFollowingTransaction>\n            </postTransactionAmounts>\n            <ownershipNature>\n                <directOrIndirectOwnership>\n                    <value>D</value>\n                </directOrIndirectOwnership>\n          "
    "<?xml version=\"1.0\"?>\n<ownershipDocument>\n\n    <schemaVersion>X0508</schemaVersion>\n\n    <documentType>4</documentType>\n\n    <periodOfReport>2024-05-15</periodOfReport>\n\n    <notSubjectToSection16>0</notSubjectToSection16>\n\n    <issuer>\n        <issuerCik>0001326801</issuerCik>\n        <issuerName>Meta Platforms, Inc.</issuerName>\n        <issuerTradingSymbol>META</issuerTradingSymbol>\n    </issuer>\n\n    <reportingOwner>\n        <reportingOwnerId>\n            <rptOwnerCik>0001734563</rptOwnerCik>\n            <rptOwnerName>Houston Andrew</rptOwnerName>\n        </reportingOwnerId>\n        <reportingOwnerAddress>\n            <rptOwnerStreet1>C/O META PLATFORMS, INC.</rptOwnerStreet1>\n            <rptOwnerStreet2>1 META WAY</rptOwnerStreet2>\n            <rptOwnerCity>MENLO PARK</rptOwnerCity>\n            <rptOwnerState>CA</rptOwnerState>\n            <rptOwnerZipCode>94025</rptOwnerZipCode>\n            <rptOwnerStateDescription></rptOwnerStateDescription>\n        </reportingOwnerAddress>\n        <reportingOwnerRelationship>\n            <isDirector>1</isDirector>\n            <isOfficer>0</isOfficer>\n            <isTenPercentOwner>0</isTenPercentOwner>\n            <isOther>0</isOther>\n            <officerTitle></officerTitle>\n            <otherText></otherText>\n        </reportingOwnerRelationship>\n    </reportingOwner>\n\n    <aff10b5One>0</aff10b5One>\n\n    <nonDerivativeTable>\n        <nonDerivativeTransaction>\n            <securityTitle>\n                <value>Class A Common Stock</value>\n            </securityTitle>\n            <transactionDate>\n                <value>2024-05-15</value>\n            </transactionDate>\n            <deemedExecutionDate></deemedExecutionDate>\n            <transactionCoding>\n                <transactionFormType>4</transactionFormType>\n                <transactionCode>M</transactionCode>\n                <equitySwapInvolved>0</equitySwapInvolved>\n            </transactionCoding>\n            <transactionTimeliness></transactionTimeliness>\n            <transactionAmounts>\n                <transactionShares>\n                    <value>1541</value>\n                    <footnoteId id=\"F1\"/>\n                </transactionShares>\n                <transactionPricePerShare>\n                    <value>0</value>\n                </transactionPricePerShare>\n                <transactionAcquiredDisposedCode>\n                    <value>A</value>\n                </transactionAcquiredDisposedCode>\n            </transactionAmounts>\n            <postTransactionAmounts>\n                <sharesOwnedFollowingTransaction>\n                    <value>11359</value>\n                </sharesOwnedFollowingTransaction>\n            </postTransactionAmounts>\n            <ownershipNature>\n                <directOrIndirectOwnership>\n                    <value>D</value>\n                </directOrIndirectOwnership>\n            </ownershipNature>\n        </nonDerivativeTransaction>\n    </nonDerivativeTable>\n\n    <derivativeTable>\n        <derivativeTransaction>\n            <securityTitle>\n                <value>Restricted Stock Units (RSU) (Class A)</value>\n            </securityTitle>\n            <conversionOrExercisePrice>\n                <footnoteId id=\"F2\"/>\n            </conversionOrExercisePrice>\n            <transactionDate>\n                <value>2024-05-15</value>\n            </transactionDate>\n            <deemedExecutionDate></deemedExecutionDate>\n            <transactionCoding>\n                <transactionFormType>4</transactionFormType>\n                <transactionCode>M</transactionCode>\n                <equitySwapInvolved>0</equitySwapInvolved>\n            </transactionCoding>\n            <transactionTimeliness></transactionTimeliness>\n            <transactionAmounts>\n                <transactionShares>\n                    <value>1541</value>\n                </transactionShares>\n                <transactionPricePerShare>\n                    <value>0</value>\n                </transactionPricePerShare>\n                <transactionAcquiredDisposedCode>\n                    <value>D</value>\n                </transactionAcquired"
    "<?xml version=\"1.0\"?>\n<ownershipDocument>\n\n    <schemaVersion>X0508</schemaVersion>\n\n    <documentType>4</documentType>\n\n    <periodOfReport>2024-05-14</periodOfReport>\n\n    <issuer>\n        <issuerCik>0001609809</issuerCik>\n        <issuerName>Seres Therapeutics, Inc.</issuerName>\n        <issuerTradingSymbol>MCRB</issuerTradingSymbol>\n    </issuer>\n\n    <reportingOwner>\n        <reportingOwnerId>\n            <rptOwnerCik>0001808592</rptOwnerCik>\n            <rptOwnerName>von Moltke Lisa</rptOwnerName>\n        </reportingOwnerId>\n        <reportingOwnerAddress>\n            <rptOwnerStreet1>C/O SERES THERAPEUTICS, INC.</rptOwnerStreet1>\n            <rptOwnerStreet2>101 CAMBRIDGE PARK DRIVE</rptOwnerStreet2>\n            <rptOwnerCity>CAMBRIDGE</rptOwnerCity>\n            <rptOwnerState>MA</rptOwnerState>\n            <rptOwnerZipCode>02140</rptOwnerZipCode>\n            <rptOwnerStateDescription></rptOwnerStateDescription>\n        </reportingOwnerAddress>\n        <reportingOwnerRelationship>\n            <isDirector>false</isDirector>\n            <isOfficer>true</isOfficer>\n            <isTenPercentOwner>false</isTenPercentOwner>\n            <isOther>false</isOther>\n            <officerTitle>See Remarks</officerTitle>\n        </reportingOwnerRelationship>\n    </reportingOwner>\n\n    <aff10b5One>true</aff10b5One>\n\n    <nonDerivativeTable>\n        <nonDerivativeTransaction>\n            <securityTitle>\n                <value>Common Stock</value>\n            </securityTitle>\n            <transactionDate>\n                <value>2024-05-15</value>\n            </transactionDate>\n            <transactionCoding>\n                <transactionFormType>4</transactionFormType>\n                <transactionCode>M</transactionCode>\n                <equitySwapInvolved>false</equitySwapInvolved>\n            </transactionCoding>\n            <transactionAmounts>\n                <transactionShares>\n                    <value>2968</value>\n                </transactionShares>\n                <transactionPricePerShare>\n                    <footnoteId id=\"F1\"/>\n                </transactionPricePerShare>\n                <transactionAcquiredDisposedCode>\n                    <value>A</value>\n                </transactionAcquiredDisposedCode>\n            </transactionAmounts>\n            <postTransactionAmounts>\n                <sharesOwnedFollowingTransaction>\n                    <value>19956</value>\n                </sharesOwnedFollowingTransaction>\n            </postTransactionAmounts>\n            <ownershipNature>\n                <directOrIndirectOwnership>\n                    <value>D</value>\n                </directOrIndirectOwnership>\n            </ownershipNature>\n        </nonDerivativeTransaction>\n        <nonDerivativeTransaction>\n            <securityTitle>\n                <value>Common Stock</value>\n            </securityTitle>\n            <transactionDate>\n                <value>2024-05-15</value>\n            </transactionDate>\n            <transactionCoding>\n                <transactionFormType>4</transactionFormType>\n                <transactionCode>S</transactionCode>\n                <equitySwapInvolved>false</equitySwapInvolved>\n                <footnoteId id=\"F2\"/>\n            </transactionCoding>\n            <transactionAmounts>\n                <transactionShares>\n                    <value>939</value>\n                </transactionShares>\n                <transactionPricePerShare>\n                    <value>0.94</value>\n                    <footnoteId id=\"F3\"/>\n                </transactionPricePerShare>\n                <transactionAcquiredDisposedCode>\n                    <value>D</value>\n                </transactionAcquiredDisposedCode>\n            </transactionAmounts>\n            <postTransactionAmounts>\n                <sharesOwnedFollowingTransaction>\n                    <value>19017</value>\n                </sharesOwnedFollowingTransaction>\n            </postTransactionAmounts>\n            <ownershipNature>\n                <directOrIndirectOwnership>\n                    <value>D</value>\n                </directOrIndirectOwnersh"
    "<?xml version=\"1.0\"?>\n<ownershipDocument>\n\n    <schemaVersion>X0508</schemaVersion>\n\n    <documentType>4</documentType>\n\n    <periodOfReport>2024-05-15</periodOfReport>\n\n    <issuer>\n        <issuerCik>0001289419</issuerCik>\n        <issuerName>Morningstar, Inc.</issuerName>\n        <issuerTradingSymbol>MORN</issuerTradingSymbol>\n    </issuer>\n\n    <reportingOwner>\n        <reportingOwnerId>\n            <rptOwnerCik>0001712782</rptOwnerCik>\n            <rptOwnerName>DUBINSKY JASON</rptOwnerName>\n        </reportingOwnerId>\n        <reportingOwnerAddress>\n            <rptOwnerStreet1>C/O MORNINGSTAR, INC.</rptOwnerStreet1>\n            <rptOwnerStreet2>22 W WASHINGTON ST</rptOwnerStreet2>\n            <rptOwnerCity>CHICAGO</rptOwnerCity>\n            <rptOwnerState>IL</rptOwnerState>\n            <rptOwnerZipCode>60602</rptOwnerZipCode>\n            <rptOwnerStateDescription></rptOwnerStateDescription>\n        </reportingOwnerAddress>\n        <reportingOwnerRelationship>\n            <isDirector>0</isDirector>\n            <isOfficer>1</isOfficer>\n            <isTenPercentOwner>0</isTenPercentOwner>\n            <isOther>0</isOther>\n            <officerTitle>Chief Financial Officer</officerTitle>\n        </reportingOwnerRelationship>\n    </reportingOwner>\n\n    <aff10b5One>0</aff10b5One>\n\n    <nonDerivativeTable>\n        <nonDerivativeTransaction>\n            <securityTitle>\n                <value>Common Stock (Restricted Stock Units)</value>\n                <footnoteId id=\"F1\"/>\n            </securityTitle>\n            <transactionDate>\n                <value>2024-05-15</value>\n            </transactionDate>\n            <transactionCoding>\n                <transactionFormType>4</transactionFormType>\n                <transactionCode>A</transactionCode>\n                <equitySwapInvolved>0</equitySwapInvolved>\n            </transactionCoding>\n            <transactionAmounts>\n                <transactionShares>\n                    <value>1387</value>\n                </transactionShares>\n                <transactionPricePerShare>\n                    <value>0</value>\n                </transactionPricePerShare>\n                <transactionAcquiredDisposedCode>\n                    <value>A</value>\n                </transactionAcquiredDisposedCode>\n            </transactionAmounts>\n            <postTransactionAmounts>\n                <sharesOwnedFollowingTransaction>\n                    <value>23538</value>\n                </sharesOwnedFollowingTransaction>\n            </postTransactionAmounts>\n            <ownershipNature>\n                <directOrIndirectOwnership>\n                    <value>D</value>\n                </directOrIndirectOwnership>\n            </ownershipNature>\n        </nonDerivativeTransaction>\n        <nonDerivativeTransaction>\n            <securityTitle>\n                <value>Common Stock</value>\n            </securityTitle>\n            <transactionDate>\n                <value>2024-05-17</value>\n            </transactionDate>\n            <transactionCoding>\n                <transactionFormType>4</transactionFormType>\n                <transactionCode>M</transactionCode>\n                <equitySwapInvolved>0</equitySwapInvolved>\n            </transactionCoding>\n            <transactionAmounts>\n                <transactionShares>\n                    <value>1254</value>\n                </transactionShares>\n                <transactionPricePerShare>\n                    <value>0</value>\n                    <footnoteId id=\"F2\"/>\n                </transactionPricePerShare>\n                <transactionAcquiredDisposedCode>\n                    <value>A</value>\n                </transactionAcquiredDisposedCode>\n            </transactionAmounts>\n            <postTransactionAmounts>\n                <sharesOwnedFollowingTransaction>\n                    <value>24792</value>\n                </sharesOwnedFollowingTransaction>\n            </postTransactionAmounts>\n            <ownershipNature>\n                <directOrIndirectOwnership>\n                    <value>D</value>\n                </directOrIndirectOwnership>\n            </o"
    "<?xml version=\"1.0\"?>\n<ownershipDocument>\n\n    <schemaVersion>X0508</schemaVersion>\n\n    <documentType>4</documentType>\n\n    <periodOfReport>2024-05-15</periodOfReport>\n\n    <notSubjectToSection16>0</notSubjectToSection16>\n\n    <issuer>\n        <issuerCik>0001326801</issuerCik>\n        <issuerName>Meta Platforms, Inc.</issuerName>\n        <issuerTradingSymbol>META</issuerTradingSymbol>\n    </issuer>\n\n    <reportingOwner>\n        <reportingOwnerId>\n            <rptOwnerCik>0002011994</rptOwnerCik>\n            <rptOwnerName>Arnold John Douglas</rptOwnerName>\n        </reportingOwnerId>\n        <reportingOwnerAddress>\n            <rptOwnerStreet1>C/O META PLATFORMS, INC.</rptOwnerStreet1>\n            <rptOwnerStreet2>1 META WAY</rptOwnerStreet2>\n            <rptOwnerCity>MENLO PARK</rptOwnerCity>\n            <rptOwnerState>CA</rptOwnerState>\n            <rptOwnerZipCode>94025</rptOwnerZipCode>\n            <rptOwnerStateDescription></rptOwnerStateDescription>\n        </reportingOwnerAddress>\n        <reportingOwnerRelationship>\n            <isDirector>1</isDirector>\n            <isOfficer>0</isOfficer>\n            <isTenPercentOwner>0</isTenPercentOwner>\n            <isOther>0</isOther>\n            <officerTitle></officerTitle>\n            <otherText></otherText>\n        </reportingOwnerRelationship>\n    </reportingOwner>\n\n    <aff10b5One>0</aff10b5One>\n\n    <nonDerivativeTable>\n        <nonDerivativeTransaction>\n            <securityTitle>\n                <value>Class A Common Stock</value>\n            </securityTitle>\n            <transactionDate>\n                <value>2024-05-15</value>\n            </transactionDate>\n            <deemedExecutionDate></deemedExecutionDate>\n            <transactionCoding>\n                <transactionFormType>4</transactionFormType>\n                <transactionCode>M</transactionCode>\n                <equitySwapInvolved>0</equitySwapInvolved>\n            </transactionCoding>\n            <transactionTimeliness></transactionTimeliness>\n            <transactionAmounts>\n                <transactionShares>\n                    <value>167</value>\n                    <footnoteId id=\"F1\"/>\n                </transactionShares>\n                <transactionPricePerShare>\n                    <value>0</value>\n                </transactionPricePerShare>\n                <transactionAcquiredDisposedCode>\n                    <value>A</value>\n                </transactionAcquiredDisposedCode>\n            </transactionAmounts>\n            <postTransactionAmounts>\n                <sharesOwnedFollowingTransaction>\n                    <value>167</value>\n                </sharesOwnedFollowingTransaction>\n            </postTransactionAmounts>\n            <ownershipNature>\n                <directOrIndirectOwnership>\n                    <value>D</value>\n                </directOrIndirectOwnership>\n            </ownershipNature>\n        </nonDerivativeTransaction>\n        <nonDerivativeTransaction>\n            <securityTitle>\n                <value>Class A Common Stock</value>\n            </securityTitle>\n            <transactionDate>\n                <value>2024-05-15</value>\n            </transactionDate>\n            <deemedExecutionDate></deemedExecutionDate>\n            <transactionCoding>\n                <transactionFormType>4</transactionFormType>\n                <transactionCode>M</transactionCode>\n                <equitySwapInvolved>0</equitySwapInvolved>\n            </transactionCoding>\n            <transactionTimeliness></transactionTimeliness>\n            <transactionAmounts>\n                <transactionShares>\n                    <value>256</value>\n                    <footnoteId id=\"F1\"/>\n                </transactionShares>\n                <transactionPricePerShare>\n                    <value>0</value>\n                </transactionPricePerShare>\n                <transactionAcquiredDisposedCode>\n                    <value>A</value>\n                </transactionAcquiredDisposedCode>\n            </transactionAmounts>\n            <postTransactionAmounts>\n                <sharesOwnedFollowingTransaction>\n     "
    """
  end
end
