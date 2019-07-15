-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 24, 2019 at 07:27 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `investment`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` mediumint(9) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_token` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_asset` decimal(15,2) NOT NULL,
  `avail_balance` decimal(15,2) NOT NULL,
  `avail_to_trade` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `name`, `password`, `email`, `session_token`, `total_asset`, `avail_balance`, `avail_to_trade`) VALUES
(1, 'Richard Nixon', 'watergate', NULL, NULL, '1000000.00', '1000000.00', '1000000.00'),
(2, 'Ronald Reagan', 'jellybean', NULL, NULL, '1000000.00', '1000000.00', '1000000.00'),
(3, 'Jimmy Carter', 'peanut', NULL, NULL, '1000000.00', '1000000.00', '1000000.00'),
(4, 'George Bush', 'readlips', NULL, NULL, '1000000.00', '1000000.00', '1000000.00'),
(5, 'Bill Clinton', 'monica', NULL, NULL, '1000000.00', '1000000.00', '1000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `account_watchlist`
--

CREATE TABLE `account_watchlist` (
  `account_id` mediumint(9) UNSIGNED NOT NULL,
  `symbol` varchar(8) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account_watchlist`
--

INSERT INTO `account_watchlist` (`account_id`, `symbol`) VALUES
(1, 'MSFT'),
(1, 'AMZN'),
(1, 'AAPL'),
(1, 'FB'),
(1, 'GOOG'),
(2, 'MSFT'),
(2, 'AMZN'),
(2, 'AAPL'),
(2, 'FB'),
(2, 'GOOG'),
(3, 'MSFT'),
(3, 'AMZN'),
(3, 'AAPL'),
(3, 'FB'),
(3, 'GOOG'),
(4, 'MSFT'),
(4, 'AMZN'),
(4, 'AAPL'),
(4, 'FB'),
(4, 'GOOG'),
(5, 'MSFT'),
(5, 'AMZN'),
(5, 'AAPL'),
(5, 'FB'),
(5, 'GOOG');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `GICS` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headquarter` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `founded` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`name`, `symbol`, `GICS`, `category`, `headquarter`, `founded`, `url`) VALUES
('Agilent Technologies Inc', 'A', 'Health Care', 'Health Care Equipment', 'Santa Clara, California', '1999', NULL),
('American Airlines Group', 'AAL', 'Industrials', 'Airlines', 'Fort Worth, Texas', '1934', NULL),
('Advance Auto Parts', 'AAP', 'Consumer Discretionary', 'Automotive Retail', 'Roanoke, Virginia', '1932', NULL),
('Apple Inc.', 'AAPL', 'Information Technology', 'Technology Hardware, Storage & Peripherals', 'Cupertino, California', '1977', NULL),
('AbbVie Inc.', 'ABBV', 'Health Care', 'Pharmaceuticals', 'North Chicago, Illinois', '2013 (1888)', NULL),
('AmerisourceBergen Corp', 'ABC', 'Health Care', 'Health Care Distributors', 'Chesterbrook, Pennsylvania', '1985', NULL),
('ABIOMED Inc', 'ABMD', 'Health Care', 'Health Care Equipment', 'Danvers, Massachusetts', '1981', NULL),
('Abbott Laboratories', 'ABT', 'Health Care', 'Health Care Equipment', 'North Chicago, Illinois', '1888', NULL),
('Accenture plc', 'ACN', 'Information Technology', 'IT Consulting & Other Services', 'Dublin, Ireland', '1989', NULL),
('Adobe Systems Inc', 'ADBE', 'Information Technology', 'Application Software', 'San Jose, California', '1982', NULL),
('Analog Devices, Inc.', 'ADI', 'Information Technology', 'Semiconductors', 'Norwood, Massachusetts', '1965', NULL),
('Archer-Daniels-Midland Co', 'ADM', 'Consumer Staples', 'Agricultural Products', 'Decatur, Illinois', '1902', NULL),
('Automatic Data Processing', 'ADP', 'Information Technology', 'Internet Services & Infrastructure', 'Roseland, New Jersey', '', NULL),
('Alliance Data Systems', 'ADS', 'Information Technology', 'Data Processing & Outsourced Services', 'Plano, Texas', '1996', NULL),
('Autodesk Inc.', 'ADSK', 'Information Technology', 'Application Software', 'San Rafael, California', '', NULL),
('Ameren Corp', 'AEE', 'Utilities', 'Multi-Utilities', 'St. Louis, Missouri', '1902', NULL),
('American Electric Power', 'AEP', 'Utilities', 'Electric Utilities', 'Columbus, Ohio', '1906', NULL),
('AES Corp', 'AES', 'Utilities', 'Independent Power Producers & Energy Traders', 'Arlington, Virginia', '1981', NULL),
('AFLAC Inc', 'AFL', 'Financials', 'Life & Health Insurance', 'Columbus, Georgia', '1955', NULL),
('Allergan, Plc', 'AGN', 'Health Care', 'Pharmaceuticals', 'Dublin, Ireland', '1983', NULL),
('American International Group', 'AIG', 'Financials', 'Property & Casualty Insurance', 'New York, New York', '1919', NULL),
('Apartment Investment & Management', 'AIV', 'Real Estate', 'Residential REITs', 'Denver, Colorado', '1994 (1975)', NULL),
('Assurant', 'AIZ', 'Financials', 'Multi-line Insurance', 'New York, New York', '', NULL),
('Arthur J. Gallagher & Co.', 'AJG', 'Financials', 'Insurance Brokers', 'Itasca, Illinois', '', NULL),
('Akamai Technologies Inc', 'AKAM', 'Information Technology', 'Internet Services & Infrastructure', 'Cambridge, Massachusetts', '1998', NULL),
('Albemarle Corp', 'ALB', 'Materials', 'Specialty Chemicals', 'Baton Rouge, Louisiana', '1994', NULL),
('Align Technology', 'ALGN', 'Health Care', 'Health Care Supplies', 'San Jose, California', '1997', NULL),
('Alaska Air Group Inc', 'ALK', 'Industrials', 'Airlines', 'Seattle, Washington', '1985', NULL),
('Allstate Corp', 'ALL', 'Financials', 'Property & Casualty Insurance', 'Northfield Township, Illinois', '1931', NULL),
('Allegion', 'ALLE', 'Industrials', 'Building Products', 'Dublin, Ireland', '1908', NULL),
('Alexion Pharmaceuticals', 'ALXN', 'Health Care', 'Biotechnology', 'Cheshire, Connecticut', '1992', NULL),
('Applied Materials Inc.', 'AMAT', 'Information Technology', 'Semiconductor Equipment', 'Santa Clara, California', '1967', NULL),
('Advanced Micro Devices Inc', 'AMD', 'Information Technology', 'Semiconductors', 'Sunnyvale, California', '1969', NULL),
('AMETEK Inc.', 'AME', 'Industrials', 'Electrical Components & Equipment', 'Berwyn, Pennsylvania', '1930', NULL),
('Affiliated Managers Group Inc', 'AMG', 'Financials', 'Asset Management & Custody Banks', 'Beverly, Massachusetts', '1993', NULL),
('Amgen Inc.', 'AMGN', 'Health Care', 'Biotechnology', 'Thousand Oaks, California', '1980', NULL),
('Ameriprise Financial', 'AMP', 'Financials', 'Asset Management & Custody Banks', 'Minneapolis, Minnesota', '1894', NULL),
('American Tower Corp.', 'AMT', 'Real Estate', 'Specialized REITs', 'Boston, Massachusetts', '1995', NULL),
('Amazon.com Inc.', 'AMZN', 'Consumer Discretionary', 'Internet & Direct Marketing Retail', 'Seattle, Washington', '1994', NULL),
('Arista Networks', 'ANET', 'Information Technology', 'Communications Equipment', 'Santa Clara, California', '2004', NULL),
('ANSYS', 'ANSS', 'Information Technology', 'Application Software', 'Canonsburg, Pennsylvania', '1969', NULL),
('Anthem Inc.', 'ANTM', 'Health Care', 'Managed Health Care', 'Indianapolis, Indiana', '2014 (1940s)', NULL),
('Aon plc', 'AON', 'Financials', 'Insurance Brokers', 'London,Â United Kingdom', '1982 (1919)', NULL),
('A.O. Smith Corp', 'AOS', 'Industrials', 'Building Products', 'Milwaukee, Wisconsin', '1916', NULL),
('Apache Corporation', 'APA', 'Energy', 'Oil & Gas Exploration & Production', 'Houston, Texas', '1954', NULL),
('Anadarko Petroleum Corp', 'APC', 'Energy', 'Oil & Gas Exploration & Production', 'The Woodlands, Texas', '1959', NULL),
('Air Products & Chemicals Inc', 'APD', 'Materials', 'Industrial Gases', 'Allentown, Pennsylvania', '1940', NULL),
('Amphenol Corp', 'APH', 'Information Technology', 'Electronic Components', 'Wallingford, Connecticut', '1932', NULL),
('Aptiv Plc', 'APTV', 'Consumer Discretionary', 'Auto Parts & Equipment', 'Gillingham, Kent,Â United Kingdom', '1994', NULL),
('Alexandria Real Estate Equities', 'ARE', 'Real Estate', 'Office REITs', 'Pasadena, California', '1994', NULL),
('Arconic Inc.', 'ARNC', 'Industrials', 'Aerospace & Defense', 'New York, New York', '2016', NULL),
('Atmos Energy Corp', 'ATO', 'Utilities', 'Gas Utilities', 'Dallas, Texas', '1906', NULL),
('Activision Blizzard', 'ATVI', 'Communication Services', 'Interactive Home Entertainment', 'Santa Monica, California', '2008', NULL),
('AvalonBay Communities, Inc.', 'AVB', 'Real Estate', 'Residential REITs', 'Arlington, Virginia[3]', '', NULL),
('Broadcom', 'AVGO', 'Information Technology', 'Semiconductors', 'San Jose, California', '', NULL),
('Avery Dennison Corp', 'AVY', 'Materials', 'Paper Packaging', 'Glendale, California', '', NULL),
('American Water Works Company Inc', 'AWK', 'Utilities', 'Water Utilities', 'Voorhees, New Jersey', '1886', NULL),
('American Express Co', 'AXP', 'Financials', 'Consumer Finance', 'New York, New York', '1850', NULL),
('AutoZone Inc', 'AZO', 'Consumer Discretionary', 'Specialty Stores', 'Memphis, Tennessee', '', NULL),
('Boeing Company', 'BA', 'Industrials', 'Aerospace & Defense', 'Chicago, Illinois', '1916', NULL),
('Bank of America Corp', 'BAC', 'Financials', 'Diversified Banks', 'Charlotte, North Carolina', '', NULL),
('Baxter International Inc.', 'BAX', 'Health Care', 'Health Care Equipment', 'Deerfield, Illinois', '1931', NULL),
('BB&T Corporation', 'BBT', 'Financials', 'Regional Banks', 'Winston-Salem, North Carolina', '', NULL),
('Best Buy Co. Inc.', 'BBY', 'Consumer Discretionary', 'Computer & Electronics Retail', 'Richfield, Minnesota', '', NULL),
('Becton Dickinson', 'BDX', 'Health Care', 'Health Care Equipment', 'Franklin Lakes, New Jersey', '1897', NULL),
('Franklin Resources', 'BEN', 'Financials', 'Asset Management & Custody Banks', 'San Mateo, California', '1947', NULL),
('Brown-Forman Corp.', 'BF.B', 'Consumer Staples', 'Distillers & Vintners', 'Louisville, Kentucky', '', NULL),
('Baker Hughes, a GE Company', 'BHGE', 'Energy', 'Oil & Gas Equipment & Services', 'Houston, Texas', '2017', NULL),
('Biogen Inc.', 'BIIB', 'Health Care', 'Biotechnology', 'Weston, Massachusetts', '', NULL),
('The Bank of New York Mellon Corp.', 'BK', 'Financials', 'Asset Management & Custody Banks', 'New York, New York', '', NULL),
('Booking Holdings Inc', 'BKNG', 'Consumer Discretionary', 'Internet & Direct Marketing Retail', 'Norwalk, Connecticut', '', NULL),
('BlackRock', 'BLK', 'Financials', 'Asset Management & Custody Banks', 'New York, New York', '', NULL),
('Ball Corp', 'BLL', 'Materials', 'Metal & Glass Containers', 'Broomfield, Colorado', '', NULL),
('Bristol-Myers Squibb', 'BMY', 'Health Care', 'Health Care Distributors', 'New York, New York', '1989', NULL),
('Broadridge Financial Solutions', 'BR', 'Information Technology', 'Data Processing & Outsourced Services', 'Lake Success, New York', '1962', NULL),
('Berkshire Hathaway', 'BRK.B', 'Financials', 'Multi-Sector Holdings', 'Omaha, Nebraska', '', NULL),
('Boston Scientific', 'BSX', 'Health Care', 'Health Care Equipment', 'Marlborough, Massachusetts[4]', '', NULL),
('BorgWarner', 'BWA', 'Consumer Discretionary', 'Auto Parts & Equipment', 'Auburn Hills, Michigan', '', NULL),
('Boston Properties', 'BXP', 'Real Estate', 'Office REITs', 'Boston, Massachusetts', '', NULL),
('Citigroup Inc.', 'C', 'Financials', 'Diversified Banks', 'New York, New York', '', NULL),
('Conagra Brands', 'CAG', 'Consumer Staples', 'Packaged Foods & Meats', 'Chicago, Illinois', '', NULL),
('Cardinal Health Inc.', 'CAH', 'Health Care', 'Health Care Distributors', 'Dublin, Ohio', '', NULL),
('Caterpillar Inc.', 'CAT', 'Industrials', 'Construction Machinery & Heavy Trucks', 'Peoria, Illinois', '1925', NULL),
('Chubb Limited', 'CB', 'Financials', 'Property & Casualty Insurance', 'Zurich, Switzerland', '', NULL),
('Cboe Global Markets', 'CBOE', 'Financials', 'Financial Exchanges & Data', 'Chicago, Illinois', '', NULL),
('CBRE Group', 'CBRE', 'Real Estate', 'Real Estate Services', 'Los Angeles, California', '', NULL),
('CBS Corp.', 'CBS', 'Communication Services', 'Broadcasting', 'New York, New York', '2006', NULL),
('Crown Castle International Corp.', 'CCI', 'Real Estate', 'Specialized REITs', 'Houston, Texas', '', NULL),
('Carnival Corp.', 'CCL', 'Consumer Discretionary', 'Hotels, Resorts & Cruise Lines', 'Miami, Florida', '', NULL),
('Cadence Design Systems', 'CDNS', 'Information Technology', 'Application Software', 'San Jose, California', '', NULL),
('Celanese Corp.', 'CE', 'Materials', 'Specialty Chemicals', 'Irving, Texas', '', NULL),
('Celgene Corp.', 'CELG', 'Health Care', 'Biotechnology', 'Summit, New Jersey', '', NULL),
('Cerner', 'CERN', 'Health Care', 'Health Care Technology', 'North Kansas City, Missouri', '', NULL),
('CF Industries Holdings Inc', 'CF', 'Materials', 'Fertilizers & Agricultural Chemicals', 'Deerfield, Illinois', '', NULL),
('Citizens Financial Group', 'CFG', 'Financials', 'Regional Banks', 'Providence, Rhode Island', '', NULL),
('Church & Dwight', 'CHD', 'Consumer Staples', 'Household Products', 'Ewing, New Jersey', '', NULL),
('C. H. Robinson Worldwide', 'CHRW', 'Industrials', 'Air Freight & Logistics', 'Eden Prairie, Minnesota', '', NULL),
('Charter Communications', 'CHTR', 'Communication Services', 'Cable & Satellite', 'Stamford, Connecticut', '', NULL),
('CIGNA Corp.', 'CI', 'Health Care', 'Managed Health Care', 'Bloomfield, Connecticut', '', NULL),
('Cincinnati Financial', 'CINF', 'Financials', 'Property & Casualty Insurance', 'Fairfield, Ohio', '', NULL),
('Colgate-Palmolive', 'CL', 'Consumer Staples', 'Household Products', 'New York, New York', '1806', NULL),
('The Clorox Company', 'CLX', 'Consumer Staples', 'Household Products', 'Oakland, California', '1913', NULL),
('Comerica Inc.', 'CMA', 'Financials', 'Diversified Banks', 'Dallas, Texas', '', NULL),
('Comcast Corp.', 'CMCSA', 'Communication Services', 'Cable & Satellite', 'Philadelphia, Pennsylvania', '', NULL),
('CME Group Inc.', 'CME', 'Financials', 'Financial Exchanges & Data', 'Chicago, Illinois', '', NULL),
('Chipotle Mexican Grill', 'CMG', 'Consumer Discretionary', 'Restaurants', 'Denver, Colorado', '', NULL),
('Cummins Inc.', 'CMI', 'Industrials', 'Industrial Machinery', 'Columbus, Indiana', '1919', NULL),
('CMS Energy', 'CMS', 'Utilities', 'Multi-Utilities', 'Jackson, Michigan', '', NULL),
('Centene Corporation', 'CNC', 'Health Care', 'Managed Health Care', 'St Louis, Missouri', '', NULL),
('CenterPoint Energy', 'CNP', 'Utilities', 'Multi-Utilities', 'Houston, Texas', '', NULL),
('Capital One Financial', 'COF', 'Financials', 'Consumer Finance', 'Tysons Corner, Virginia', '1935', NULL),
('Cabot Oil & Gas', 'COG', 'Energy', 'Oil & Gas Exploration & Production', 'Houston, Texas', '', NULL),
('The Cooper Companies', 'COO', 'Health Care', 'Health Care Supplies', 'Pleasanton, California', '', NULL),
('ConocoPhillips', 'COP', 'Energy', 'Oil & Gas Exploration & Production', 'Houston, Texas', '2002', NULL),
('Costco Wholesale Corp.', 'COST', 'Consumer Staples', 'Hypermarkets & Super Centers', 'Issaquah, Washington', '', NULL),
('Coty, Inc', 'COTY', 'Consumer Staples', 'Personal Products', 'New York, New York', '', NULL),
('Campbell Soup', 'CPB', 'Consumer Staples', 'Packaged Foods & Meats', 'Camden, New Jersey', '1869', NULL),
('Capri Holdings', 'CPRI', 'Consumer Discretionary', 'Apparel, Accessories & Luxury Goods', 'New York, New York', '', NULL),
('Copart Inc', 'CPRT', 'Industrials', 'Diversified Support Services', 'Dallas, Texas', '', NULL),
('Salesforce.com', 'CRM', 'Information Technology', 'Internet Software & Services', 'San Francisco, California', '', NULL),
('Cisco Systems', 'CSCO', 'Information Technology', 'Communications Equipment', 'San Jose, California', '', NULL),
('CSX Corp.', 'CSX', 'Industrials', 'Railroads', 'Jacksonville, Florida', '1980', NULL),
('Cintas Corporation', 'CTAS', 'Industrials', 'Diversified Support Services', 'Mason, Ohio', '', NULL),
('CenturyLink Inc', 'CTL', 'Communication Services', 'Integrated Telecommunication Services', 'Monroe, Louisiana', '', NULL),
('Cognizant Technology Solutions', 'CTSH', 'Information Technology', 'IT Consulting & Other Services', 'Teaneck, New Jersey', '', NULL),
('Citrix Systems', 'CTXS', 'Information Technology', 'Internet Software & Services', 'Fort Lauderdale, Florida', '', NULL),
('CVS Health', 'CVS', 'Health Care', 'Health Care Services', 'Woonsocket, Rhode Island', '1996', NULL),
('Chevron Corp.', 'CVX', 'Energy', 'Integrated Oil & Gas', 'San Ramon, California', '1879', NULL),
('Concho Resources', 'CXO', 'Energy', 'Oil & Gas Exploration & Production', 'Midland, Texas', '', NULL),
('Dominion Energy', 'D', 'Utilities', 'Electric Utilities', 'Richmond, Virginia', '1983', NULL),
('Delta Air Lines Inc.', 'DAL', 'Industrials', 'Airlines', 'Atlanta, Georgia', '', NULL),
('Deere & Co.', 'DE', 'Industrials', 'Agricultural & Farm Machinery', 'Moline, Illinois', '1837', NULL),
('Discover Financial Services', 'DFS', 'Financials', 'Consumer Finance', 'Riverwoods, Illinois', '', NULL),
('Dollar General', 'DG', 'Consumer Discretionary', 'General Merchandise Stores', 'Goodlettsville, Tennessee', '', NULL),
('Quest Diagnostics', 'DGX', 'Health Care', 'Health Care Services', 'Madison, New Jersey', '', NULL),
('D. R. Horton', 'DHI', 'Consumer Discretionary', 'Homebuilding', 'Fort Worth, Texas', '1978', NULL),
('Danaher Corp.', 'DHR', 'Health Care', 'Health Care Equipment', 'Washington, D.C.', '1969', NULL),
('The Walt Disney Company', 'DIS', 'Communication Services', 'Movies & Entertainment', 'Burbank, California', '', NULL),
('Discovery Inc. Class A', 'DISCA', 'Communication Services', 'Broadcasting', 'Silver Spring, Maryland', '', NULL),
('Discovery Inc. Class C', 'DISCK', 'Communication Services', 'Broadcasting', 'Silver Spring, Maryland', '', NULL),
('Dish Network', 'DISH', 'Communication Services', 'Cable & Satellite', 'Meridian, Colorado', '', NULL),
('Digital Realty Trust Inc', 'DLR', 'Real Estate', 'Specialized REITs', 'San Francisco, California', '', NULL),
('Dollar Tree', 'DLTR', 'Consumer Discretionary', 'General Merchandise Stores', 'Chesapeake, Virginia', '', NULL),
('Dover Corp.', 'DOV', 'Industrials', 'Industrial Machinery', 'Downers Grove, Illinois', '', NULL),
('Dow Inc.', 'DOW', 'Materials', 'Commodity Chemicals', 'Midland, Michigan', '2019', NULL),
('Duke Realty Corp', 'DRE', 'Real Estate', 'Industrial REITs', 'Indianapolis, Indiana', '', NULL),
('Darden Restaurants', 'DRI', 'Consumer Discretionary', 'Restaurants', 'Orlando, Florida', '1938', NULL),
('DTE Energy Co.', 'DTE', 'Utilities', 'Multi-Utilities', 'Detroit, Michigan', '1995', NULL),
('Duke Energy', 'DUK', 'Utilities', 'Electric Utilities', 'Charlotte, North Carolina', '', NULL),
('DaVita Inc.', 'DVA', 'Health Care', 'Health Care Facilities', 'Denver, Colorado', '', NULL),
('Devon Energy', 'DVN', 'Energy', 'Oil & Gas Exploration & Production', 'Oklahoma City, Oklahoma', '', NULL),
('DowDuPont', 'DWDP', 'Materials', 'Specialty Chemicals', 'Midland, Michigan', '2017', NULL),
('DXC Technology', 'DXC', 'Information Technology', 'IT Consulting & Other Services', 'Tysons Corner, Virginia', '', NULL),
('Electronic Arts', 'EA', 'Communication Services', 'Interactive Home Entertainment', 'Redwood City, California', '', NULL),
('eBay Inc.', 'EBAY', 'Consumer Discretionary', 'Internet & Direct Marketing Retail', 'San Jose, California', '1995', NULL),
('Ecolab Inc.', 'ECL', 'Materials', 'Specialty Chemicals', 'St. Paul, Minnesota', '', NULL),
('Consolidated Edison', 'ED', 'Utilities', 'Electric Utilities', 'New York, New York', '1823', NULL),
('Equifax Inc.', 'EFX', 'Industrials', 'Research & Consulting Services', 'Atlanta, Georgia', '', NULL),
('Edison Int\'l', 'EIX', 'Utilities', 'Electric Utilities', 'Rosemead, California', '1886', NULL),
('Estee Lauder Cos.', 'EL', 'Consumer Staples', 'Personal Products', 'New York, New York', '', NULL),
('Eastman Chemical', 'EMN', 'Materials', 'Diversified Chemicals', 'Kingsport, Tennessee', '', NULL),
('Emerson Electric Company', 'EMR', 'Industrials', 'Electrical Components & Equipment', 'Ferguson, Missouri', '1890', NULL),
('EOG Resources', 'EOG', 'Energy', 'Oil & Gas Exploration & Production', 'Houston, Texas', '', NULL),
('Equinix', 'EQIX', 'Real Estate', 'Specialized REITs', 'Redwood City, California', '', NULL),
('Equity Residential', 'EQR', 'Real Estate', 'Residential REITs', 'Chicago, Illinois', '', NULL),
('Eversource Energy', 'ES', 'Utilities', 'Multi-Utilities', 'Springfield, Massachusetts', '1966', NULL),
('Essex Property Trust, Inc.', 'ESS', 'Real Estate', 'Residential REITs', 'Palo Alto, California', '', NULL),
('E*Trade', 'ETFC', 'Financials', 'Investment Banking & Brokerage', 'New York, New York', '', NULL),
('Eaton Corporation', 'ETN', 'Industrials', 'Electrical Components & Equipment', 'Dublin, Ireland', '1911', NULL),
('Entergy Corp.', 'ETR', 'Utilities', 'Electric Utilities', 'New Orleans, Louisiana', '1913', NULL),
('Evergy', 'EVRG', 'Utilities', 'Electric Utilities', 'Kansas City, Missouri', '1909', NULL),
('Edwards Lifesciences', 'EW', 'Health Care', 'Health Care Equipment', 'Irvine, California', '', NULL),
('Exelon Corp.', 'EXC', 'Utilities', 'Multi-Utilities', 'Chicago, Illinois', '2000', NULL),
('Expeditors', 'EXPD', 'Industrials', 'Air Freight & Logistics', 'Seattle, Washington', '', NULL),
('Expedia Group', 'EXPE', 'Consumer Discretionary', 'Internet & Direct Marketing Retail', 'Bellevue, Washington', '', NULL),
('Extra Space Storage', 'EXR', 'Real Estate', 'Specialized REITs', 'Salt Lake City, Utah', '', NULL),
('Ford Motor', 'F', 'Consumer Discretionary', 'Automobile Manufacturers', 'Dearborn, Michigan', '1903', NULL),
('Diamondback Energy', 'FANG', 'Energy', 'Oil & Gas Exploration & Production', 'Midland, Texas', '2007', NULL),
('Fastenal Co', 'FAST', 'Industrials', 'Building Products', 'Winona, Minnesota', '', NULL),
('Facebook, Inc.', 'FB', 'Communication Services', 'Interactive Media & Services', 'Menlo Park, California', '', NULL),
('Fortune Brands Home & Security', 'FBHS', 'Industrials', 'Building Products', 'Deerfield, Illinois', '', NULL),
('Freeport-McMoRan Inc.', 'FCX', 'Materials', 'Copper', 'Phoenix, Arizona', '1912', NULL),
('FedEx Corporation', 'FDX', 'Industrials', 'Air Freight & Logistics', 'Memphis, Tennessee', '', NULL),
('FirstEnergy Corp', 'FE', 'Utilities', 'Electric Utilities', 'Akron, Ohio', '1997', NULL),
('F5 Networks', 'FFIV', 'Information Technology', 'Communications Equipment', 'Seattle, Washington', '1996', NULL),
('Fidelity National Information Services', 'FIS', 'Information Technology', 'Internet Software & Services', 'Jacksonville, Florida', '', NULL),
('Fiserv Inc', 'FISV', 'Information Technology', 'Internet Software & Services', 'Brookfield, Wisconsin', '', NULL),
('Fifth Third Bancorp', 'FITB', 'Financials', 'Regional Banks', 'Cincinnati, Ohio', '1858', NULL),
('Foot Locker Inc', 'FL', 'Consumer Discretionary', 'Apparel Retail', 'New York, New York', '', NULL),
('FLIR Systems', 'FLIR', 'Information Technology', 'Electronic Equipment & Instruments', 'Wilsonville, Oregon', '', NULL),
('Fluor Corp.', 'FLR', 'Industrials', 'Construction & Engineering', 'Irving, Texas', '', NULL),
('Flowserve Corporation', 'FLS', 'Industrials', 'Industrial Machinery', 'Irving, Texas', '', NULL),
('FleetCor Technologies Inc', 'FLT', 'Information Technology', 'Data Processing & Outsources Services', 'Norcross, Georgia', '2000', NULL),
('FMC Corporation', 'FMC', 'Materials', 'Fertilizers & Agricultural Chemicals', 'Philadelphia, Pennsylvania', '', NULL),
('Twenty-First Century Fox Class B', 'FOX', 'Communication Services', 'Movies & Entertainment', 'New York, New York', '', NULL),
('Twenty-First Century Fox Class A', 'FOXA', 'Communication Services', 'Movies & Entertainment', 'New York, New York', '', NULL),
('First Republic Bank', 'FRC', 'Financials', 'Regional Banks', 'San Francisco, California', '1985', NULL),
('Federal Realty Investment Trust', 'FRT', 'Real Estate', 'Retail REITs', 'Rockville, Maryland', '', NULL),
('TechnipFMC', 'FTI', 'Energy', 'Oil & Gas Equipment & Services', 'London,Â United Kingdom', '', NULL),
('Fortinet', 'FTNT', 'Information Technology', 'Systems Software', 'Sunnyvale, California', '2000', NULL),
('Fortive Corp', 'FTV', 'Industrials', 'Industrial Machinery', 'Everett, Washington', '', NULL),
('General Dynamics', 'GD', 'Industrials', 'Aerospace & Defense', 'Falls Church, Virginia', '1899', NULL),
('General Electric', 'GE', 'Industrials', 'Industrial Conglomerates', 'Boston, Massachusetts', '1892', NULL),
('Gilead Sciences', 'GILD', 'Health Care', 'Biotechnology', 'Foster City, California', '', NULL),
('General Mills', 'GIS', 'Consumer Staples', 'Packaged Foods & Meats', 'Golden Valley, Minnesota', '1856', NULL),
('Corning Inc.', 'GLW', 'Information Technology', 'Electronic Components', 'Corning, New York', '1851', NULL),
('General Motors', 'GM', 'Consumer Discretionary', 'Automobile Manufacturers', 'Detroit, Michigan', '', NULL),
('Alphabet Inc Class C', 'GOOG', 'Communication Services', 'Interactive Media & Services', 'Mountain View, California', '1998', NULL),
('Alphabet Inc Class A', 'GOOGL', 'Communication Services', 'Interactive Media & Services', 'Mountain View, California', '1998', NULL),
('Genuine Parts', 'GPC', 'Consumer Discretionary', 'Specialty Stores', 'Atlanta, Georgia', '1925', NULL),
('Global Payments Inc.', 'GPN', 'Information Technology', 'Data Processing & Outsourced Services', 'Atlanta, Georgia', '', NULL),
('Gap Inc.', 'GPS', 'Consumer Discretionary', 'Apparel Retail', 'San Francisco, California', '', NULL),
('Garmin Ltd.', 'GRMN', 'Consumer Discretionary', 'Consumer Electronics', 'Schaffhausen, Switzerland', '', NULL),
('Goldman Sachs Group', 'GS', 'Financials', 'Investment Banking & Brokerage', 'New York, New York', '', NULL),
('Grainger (W.W.) Inc.', 'GWW', 'Industrials', 'Industrial Machinery', 'Lake Forest, Illinois', '', NULL),
('Halliburton Co.', 'HAL', 'Energy', 'Oil & Gas Equipment & Services', 'Houston, Texas', '1919', NULL),
('Hasbro Inc.', 'HAS', 'Consumer Discretionary', 'Leisure Products', 'Pawtucket, Rhode Island', '', NULL),
('Huntington Bancshares', 'HBAN', 'Financials', 'Regional Banks', 'Columbus, Ohio', '1866', NULL),
('Hanesbrands Inc', 'HBI', 'Consumer Discretionary', 'Apparel, Accessories & Luxury Goods', 'Winston-Salem, North Carolina', '', NULL),
('HCA Holdings', 'HCA', 'Health Care', 'Health Care Facilities', 'Nashville, Tennessee', '', NULL),
('HCP Inc.', 'HCP', 'Real Estate', 'Health Care REITs', 'Long Beach, California', '', NULL),
('Home Depot', 'HD', 'Consumer Discretionary', 'Home Improvement Retail', 'Atlanta, Georgia', '', NULL),
('Hess Corporation', 'HES', 'Energy', 'Integrated Oil & Gas', 'New York, New York', '', NULL),
('HollyFrontier Corp', 'HFC', 'Energy', 'Oil & Gas Refining & Marketing', 'Dallas, Texas', '', NULL),
('Hartford Financial Svc.Gp.', 'HIG', 'Financials', 'Property & Casualty Insurance', 'Hartford, Connecticut', '', NULL),
('Huntington Ingalls Industries', 'HII', 'Industrials', 'Aerospace & Defense', 'Newport News, Virginia', '', NULL),
('Hilton Worldwide Holdings Inc', 'HLT', 'Consumer Discretionary', 'Hotels, Resorts & Cruise Lines', 'Tysons Corner, Virginia', '', NULL),
('Harley-Davidson', 'HOG', 'Consumer Discretionary', 'Motorcycle Manufacturers', 'Milwaukee, Wisconsin', '1903', NULL),
('Hologic', 'HOLX', 'Health Care', 'Health Care Equipment', 'Marlborough, Massachusetts', '', NULL),
('Honeywell Int\'l Inc.', 'HON', 'Industrials', 'Industrial Conglomerates', 'Morristown, New Jersey', '1906', NULL),
('Helmerich & Payne', 'HP', 'Energy', 'Oil & Gas Drilling', 'Tulsa, Oklahoma[5]', '', NULL),
('Hewlett Packard Enterprise', 'HPE', 'Information Technology', 'Technology Hardware, Storage & Peripherals', 'Palo Alto, California', '', NULL),
('HP Inc.', 'HPQ', 'Information Technology', 'Technology Hardware, Storage & Peripherals', 'Palo Alto, California', '1939 (2015)', NULL),
('Block H&R', 'HRB', 'Consumer Discretionary', 'Specialized Consumer Services', 'Kansas City, Missouri', '', NULL),
('Hormel Foods Corp.', 'HRL', 'Consumer Staples', 'Packaged Foods & Meats', 'Austin, Minnesota', '', NULL),
('Harris Corporation', 'HRS', 'Industrials', 'Aerospace & Defense', 'Melbourne, Florida', '', NULL),
('Henry Schein', 'HSIC', 'Health Care', 'Health Care Distributors', 'Melville, New York', '', NULL),
('Host Hotels & Resorts', 'HST', 'Real Estate', 'Hotel & Resort REITs', 'Bethesda, Maryland', '', NULL),
('The Hershey Company', 'HSY', 'Consumer Staples', 'Packaged Foods & Meats', 'Hershey, Pennsylvania', '1894', NULL),
('Humana Inc.', 'HUM', 'Health Care', 'Managed Health Care', 'Louisville, Kentucky', '1961', NULL),
('International Business Machines', 'IBM', 'Information Technology', 'IT Consulting & Other Services', 'Armonk, New York', '1911', NULL),
('Intercontinental Exchange', 'ICE', 'Financials', 'Financial Exchanges & Data', 'Atlanta, Georgia', '', NULL),
('IDEXX Laboratories', 'IDXX', 'Health Care', 'Health Care Equipment', 'Westbrook, Maine', '', NULL),
('Intl Flavors & Fragrances', 'IFF', 'Materials', 'Specialty Chemicals', 'New York, New York', '', NULL),
('Illumina Inc', 'ILMN', 'Health Care', 'Life Sciences Tools & Services', 'San Diego, California', '', NULL),
('Incyte', 'INCY', 'Health Care', 'Biotechnology', 'Wilmington, Delaware', '', NULL),
('IHS Markit Ltd.', 'INFO', 'Industrials', 'Research & Consulting Services', 'London,Â United Kingdom', '', NULL),
('Intel Corp.', 'INTC', 'Information Technology', 'Semiconductors', 'Santa Clara, California', '', NULL),
('Intuit Inc.', 'INTU', 'Information Technology', 'Internet Software & Services', 'Mountain View, California', '', NULL),
('International Paper', 'IP', 'Materials', 'Paper Packaging', 'Memphis, Tennessee', '1898', NULL),
('Interpublic Group', 'IPG', 'Communication Services', 'Advertising', 'New York, New York', '', NULL),
('IPG Photonics Corp.', 'IPGP', 'Information Technology', 'Electronic Manufacturing Services', 'Oxford, Massachusetts', '', NULL),
('IQVIA Holdings Inc.', 'IQV', 'Health Care', 'Life Sciences Tools & Service', 'Durham, North Carolina', '', NULL),
('Ingersoll-Rand PLC', 'IR', 'Industrials', 'Industrial Machinery', 'Dublin, Ireland', '', NULL),
('Iron Mountain Incorporated', 'IRM', 'Real Estate', 'Specialized REITs', 'Boston, Massachusetts', '', NULL),
('Intuitive Surgical Inc.', 'ISRG', 'Health Care', 'Health Care Equipment', 'Sunnyvale, California', '', NULL),
('Gartner Inc', 'IT', 'Information Technology', 'IT Consulting & Other Services', 'Stamford, Connecticut', '', NULL),
('Illinois Tool Works', 'ITW', 'Industrials', 'Industrial Machinery', 'Glenview, Illinois', '', NULL),
('Invesco Ltd.', 'IVZ', 'Financials', 'Asset Management & Custody Banks', 'Atlanta, Georgia', '', NULL),
('J. B. Hunt Transport Services', 'JBHT', 'Industrials', 'Trucking', 'Lowell, Arkansas', '', NULL),
('Johnson Controls International', 'JCI', 'Industrials', 'Building Products', 'Cork, Ireland', '', NULL),
('Jacobs Engineering Group', 'JEC', 'Industrials', 'Construction & Engineering', 'Pasadena, California', '', NULL),
('Jefferies Financial Group', 'JEF', 'Financials', 'Multi-Sector Holdings', 'New York, New York', '', NULL),
('Jack Henry & Associates Inc', 'JKHY', 'Information Technology', 'Data Processing & Outsourced Services', 'Monett, Missouri', '', NULL),
('Johnson & Johnson', 'JNJ', 'Health Care', 'Pharmaceuticals', 'New Brunswick, New Jersey', '1886', NULL),
('Juniper Networks', 'JNPR', 'Information Technology', 'Communications Equipment', 'Sunnyvale, California', '1996', NULL),
('JPMorgan Chase & Co.', 'JPM', 'Financials', 'Diversified Banks', 'New York, New York', '', NULL),
('Nordstrom', 'JWN', 'Consumer Discretionary', 'Department Stores', 'Seattle, Washington', '', NULL),
('Kellogg Co.', 'K', 'Consumer Staples', 'Packaged Foods & Meats', 'Battle Creek, Michigan', '1906', NULL),
('KeyCorp', 'KEY', 'Financials', 'Regional Banks', 'Cleveland, Ohio', '', NULL),
('Keysight Technologies', 'KEYS', 'Information Technology', 'Electronic Equipment & Instruments', 'Santa Rosa, California', '2014', NULL),
('Kraft Heinz Co', 'KHC', 'Consumer Staples', 'Packaged Foods & Meats', 'Pittsburgh, Pennsylvania', '', NULL),
('Kimco Realty', 'KIM', 'Real Estate', 'Retail REITs', 'New Hyde Park, New York', '', NULL),
('KLA-Tencor Corp.', 'KLAC', 'Information Technology', 'Semiconductor Equipment', 'Milpitas, California', '1975/1977 (1', NULL),
('Kimberly-Clark', 'KMB', 'Consumer Staples', 'Household Products', 'Irving, Texas', '1872', NULL),
('Kinder Morgan', 'KMI', 'Energy', 'Oil & Gas Storage & Transportation', 'Houston, Texas', '', NULL),
('Carmax Inc', 'KMX', 'Consumer Discretionary', 'Specialty Stores', 'Richmond, Virginia', '', NULL),
('Coca-Cola Company', 'KO', 'Consumer Staples', 'Soft Drinks', 'Atlanta, Georgia', '1886', NULL),
('Kroger Co.', 'KR', 'Consumer Staples', 'Food Retail', 'Cincinnati, Ohio', '1883', NULL),
('Kohl\'s Corp.', 'KSS', 'Consumer Discretionary', 'General Merchandise Stores', 'Menomonee Falls, Wisconsin', '1962', NULL),
('Kansas City Southern', 'KSU', 'Industrials', 'Railroads', 'Kansas City, Missouri', '', NULL),
('Loews Corp.', 'L', 'Financials', 'Multi-line Insurance', 'New York, New York', '', NULL),
('L Brands Inc.', 'LB', 'Consumer Discretionary', 'Apparel Retail', 'Columbus, Ohio', '', NULL),
('Leggett & Platt', 'LEG', 'Consumer Discretionary', 'Home Furnishings', 'Carthage, Missouri', '1883', NULL),
('Lennar Corp.', 'LEN', 'Consumer Discretionary', 'Homebuilding', 'Miami, Florida', '', NULL),
('Laboratory Corp. of America Holding', 'LH', 'Health Care', 'Health Care Services', 'Burlington, North Carolina', '', NULL),
('Linde plc', 'LIN', 'Materials', 'Industrial Gases', 'Guildford, Surrey, United Kingdom', '', NULL),
('LKQ Corporation', 'LKQ', 'Consumer Discretionary', 'Distributors', 'Chicago, Illinois', '', NULL),
('L-3 Communications Holdings', 'LLL', 'Industrials', 'Aerospace & Defense', 'New York, New York', '1997', NULL),
('Lilly (Eli) & Co.', 'LLY', 'Health Care', 'Pharmaceuticals', 'Indianapolis, Indiana', '1876', NULL),
('Lockheed Martin Corp.', 'LMT', 'Industrials', 'Aerospace & Defense', 'Bethesda, Maryland', '', NULL),
('Lincoln National', 'LNC', 'Financials', 'Multi-line Insurance', 'Radnor, Pennsylvania', '', NULL),
('Alliant Energy Corp', 'LNT', 'Utilities', 'Electric Utilities', 'Madison, Wisconsin', '1917', NULL),
('Lowe\'s Cos.', 'LOW', 'Consumer Discretionary', 'Home Improvement Retail', 'Mooresville, North Carolina', '1904/1946/19', NULL),
('Lam Research', 'LRCX', 'Information Technology', 'Semiconductor Equipment', 'Fremont, California', '', NULL),
('Southwest Airlines', 'LUV', 'Industrials', 'Airlines', 'Dallas, Texas', '', NULL),
('Lamb Weston Holdings Inc', 'LW', 'Consumer Staples', 'Packaged Foods & Meats', 'Eagle, Idaho', '', NULL),
('LyondellBasell', 'LYB', 'Materials', 'Specialty Chemicals', 'Rotterdam, Netherlands', '', NULL),
('Macy\'s Inc.', 'M', 'Consumer Discretionary', 'Department Stores', 'Cincinnati, Ohio', '1929', NULL),
('Mastercard Inc.', 'MA', 'Information Technology', 'IT Services', 'Harrison, New York', '', NULL),
('Mid-America Apartments', 'MAA', 'Real Estate', 'Residential REITs', 'Memphis, Tennessee', '', NULL),
('Macerich', 'MAC', 'Real Estate', 'Retail REITs', 'Santa Monica, California', '', NULL),
('Marriott Int\'l.', 'MAR', 'Consumer Discretionary', 'Hotels, Resorts & Cruise Lines', 'Bethesda, Maryland', '1927', NULL),
('Masco Corp.', 'MAS', 'Industrials', 'Building Products', 'Taylor, Michigan', '', NULL),
('Mattel Inc.', 'MAT', 'Consumer Discretionary', 'Leisure Products', 'El Segundo, California', '', NULL),
('McDonald\'s Corp.', 'MCD', 'Consumer Discretionary', 'Restaurants', 'Chicago, Illinois', '1940', NULL),
('Microchip Technology', 'MCHP', 'Information Technology', 'Semiconductors', 'Chandler, Arizona', '', NULL),
('McKesson Corp.', 'MCK', 'Health Care', 'Health Care Distributors', 'San Francisco, California', '1833', NULL),
('Moody\'s Corp', 'MCO', 'Financials', 'Financial Exchanges & Data', 'New York, New York', '1909', NULL),
('Mondelez International', 'MDLZ', 'Consumer Staples', 'Packaged Foods & Meats', 'Deerfield, Illinois', '', NULL),
('Medtronic plc', 'MDT', 'Health Care', 'Health Care Equipment', 'Dublin,Â Ireland', '', NULL),
('MetLife Inc.', 'MET', 'Financials', 'Life & Health Insurance', 'New York, New York', '1868', NULL),
('MGM Resorts International', 'MGM', 'Consumer Discretionary', 'Casinos & Gaming', 'Paradise, Nevada', '', NULL),
('Mohawk Industries', 'MHK', 'Consumer Discretionary', 'Home Furnishings', 'Amsterdam, New York', '', NULL),
('McCormick & Co.', 'MKC', 'Consumer Staples', 'Packaged Foods & Meats', 'Sparks, Maryland', '1889', NULL),
('Martin Marietta Materials', 'MLM', 'Materials', 'Construction Materials', 'Raleigh, North Carolina', '', NULL),
('Marsh & McLennan', 'MMC', 'Financials', 'Insurance Brokers', 'New York, New York', '', NULL),
(' Company', 'MMM', 'Industrials', 'Industrial Conglomerates', 'St. Paul, Minnesota', '1902', NULL),
('Monster Beverage', 'MNST', 'Consumer Staples', 'Soft Drinks', 'Corona, California', '', NULL),
('Altria Group Inc', 'MO', 'Consumer Staples', 'Tobacco', 'Richmond, Virginia', '1985', NULL),
('The Mosaic Company', 'MOS', 'Materials', 'Fertilizers & Agricultural Chemicals', 'Plymouth, Minnesota', '', NULL),
('Marathon Petroleum', 'MPC', 'Energy', 'Oil & Gas Refining & Marketing', 'Findlay, Ohio', '', NULL),
('Merck & Co.', 'MRK', 'Health Care', 'Pharmaceuticals', 'Whitehouse Station, New Jersey', '1891', NULL),
('Marathon Oil Corp.', 'MRO', 'Energy', 'Oil & Gas Exploration & Production', 'Houston, Texas', '', NULL),
('Morgan Stanley', 'MS', 'Financials', 'Investment Banking & Brokerage', 'New York, New York', '1935', NULL),
('MSCI Inc', 'MSCI', 'Financials', 'Financial Exchanges & Data', 'New York, New York', '', NULL),
('Microsoft Corp.', 'MSFT', 'Information Technology', 'Systems Software', 'Redmond, Washington', '1975', NULL),
('Motorola Solutions Inc.', 'MSI', 'Information Technology', 'Communications Equipment', 'Schaumburg, Illinois', '1928 (2011)', NULL),
('M&T Bank Corp.', 'MTB', 'Financials', 'Regional Banks', 'Buffalo, New York', '1856', NULL),
('Mettler Toledo', 'MTD', 'Health Care', 'Life Sciences Tools & Services', 'Columbus, Ohio', '', NULL),
('Micron Technology', 'MU', 'Information Technology', 'Semiconductors', 'Boise, Idaho', '', NULL),
('Maxim Integrated Products Inc', 'MXIM', 'Information Technology', 'Semiconductors', 'San Jose, California', '1983', NULL),
('Mylan N.V.', 'MYL', 'Health Care', 'Pharmaceuticals', 'Amsterdam,Â Netherlands', '', NULL),
('Noble Energy Inc', 'NBL', 'Energy', 'Oil & Gas Exploration & Production', 'Houston, Texas', '', NULL),
('Norwegian Cruise Line', 'NCLH', 'Consumer Discretionary', 'Hotels, Resorts & Cruise Lines', 'Miami, Florida', '', NULL),
('Nasdaq, Inc.', 'NDAQ', 'Financials', 'Financial Exchanges & Data', 'New York, New York', '', NULL),
('NextEra Energy', 'NEE', 'Utilities', 'Multi-Utilities', 'Juno Beach, Florida', '', NULL),
('Newmont Mining Corporation', 'NEM', 'Materials', 'Gold', 'Denver, Colorado', '1921', NULL),
('Netflix Inc.', 'NFLX', 'Communication Services', 'Movies & Entertainment', 'Los Gatos, California', '1997', NULL),
('NiSource Inc.', 'NI', 'Utilities', 'Multi-Utilities', 'Merrillville, Indiana', '1912', NULL),
('Nike', 'NKE', 'Consumer Discretionary', 'Apparel, Accessories & Luxury Goods', 'Washington County, Oregon', '', NULL),
('Nektar Therapeutics', 'NKTR', 'Health Care', 'Pharmaceuticals', 'San Francisco, California', '', NULL),
('Nielsen Holdings', 'NLSN', 'Industrials', 'Research & Consulting Services', 'New York, New York', '', NULL),
('Northrop Grumman Corp.', 'NOC', 'Industrials', 'Aerospace & Defense', 'West Falls Church, Virginia', '', NULL),
('National Oilwell Varco Inc.', 'NOV', 'Energy', 'Oil & Gas Equipment & Services', 'Houston, Texas', '', NULL),
('NRG Energy', 'NRG', 'Utilities', 'Independent Power Producers & Energy Traders', 'Princeton, New Jersey', '', NULL),
('Norfolk Southern Corp.', 'NSC', 'Industrials', 'Railroads', 'Norfolk, Virginia', '1881/1894 (1', NULL),
('NetApp', 'NTAP', 'Information Technology', 'Internet Software & Services', 'Sunnyvale, California', '', NULL),
('Northern Trust Corp.', 'NTRS', 'Financials', 'Asset Management & Custody Banks', 'Chicago, Illinois', '1889', NULL),
('Nucor Corp.', 'NUE', 'Materials', 'Steel', 'Charlotte, North Carolina', '', NULL),
('Nvidia Corporation', 'NVDA', 'Information Technology', 'Semiconductors', 'Santa Clara, California', '', NULL),
('Newell Brands', 'NWL', 'Consumer Discretionary', 'Housewares & Specialties', 'Sandy Springs, Georgia', '', NULL),
('News Corp. Class B', 'NWS', 'Communication Services', 'Publishing', 'New York, New York', '', NULL),
('News Corp. Class A', 'NWSA', 'Communication Services', 'Publishing', 'New York, New York', '', NULL),
('Realty Income Corporation', 'O', 'Real Estate', 'Retail REITs', 'San Diego, California', '', NULL),
('ONEOK', 'OKE', 'Energy', 'Oil & Gas Storage & Transportation', 'Tulsa, Oklahoma', '', NULL),
('Omnicom Group', 'OMC', 'Communication Services', 'Advertising', 'New York, New York', '1986', NULL),
('Oracle Corp.', 'ORCL', 'Information Technology', 'Application Software', 'Redwood Shores, California', '', NULL),
('O\'Reilly Automotive', 'ORLY', 'Consumer Discretionary', 'Specialty Stores', 'Springfield, Missouri', '', NULL),
('Occidental Petroleum', 'OXY', 'Energy', 'Oil & Gas Exploration & Production', 'Los Angeles, California', '', NULL),
('Paychex Inc.', 'PAYX', 'Information Technology', 'Internet Software & Services', 'Penfield, New York', '1971', NULL),
('People\'s United Financial', 'PBCT', 'Financials', 'Thrifts & Mortgage Finance', 'Bridgeport, Connecticut', '', NULL),
('PACCAR Inc.', 'PCAR', 'Industrials', 'Construction Machinery & Heavy Trucks', 'Bellevue, Washington', '', NULL),
('Public Serv. Enterprise Inc.', 'PEG', 'Utilities', 'Electric Utilities', 'Newark, New Jersey', '', NULL),
('PepsiCo Inc.', 'PEP', 'Consumer Staples', 'Soft Drinks', 'Purchase, New York', '1898', NULL),
('Pfizer Inc.', 'PFE', 'Health Care', 'Pharmaceuticals', 'New York, New York', '1849', NULL),
('Principal Financial Group', 'PFG', 'Financials', 'Life & Health Insurance', 'Des Moines, Iowa', '', NULL),
('Procter & Gamble', 'PG', 'Consumer Staples', 'Personal Products', 'Cincinnati, Ohio', '1837', NULL),
('Progressive Corp.', 'PGR', 'Financials', 'Property & Casualty Insurance', 'Mayfield Village, Ohio', '', NULL),
('Parker-Hannifin', 'PH', 'Industrials', 'Industrial Machinery', 'Cleveland, Ohio', '', NULL),
('Pulte Homes Inc.', 'PHM', 'Consumer Discretionary', 'Homebuilding', 'Atlanta, Georgia', '', NULL),
('Packaging Corporation of America', 'PKG', 'Materials', 'Paper Packaging', 'Lake Forest, Illinois', '', NULL),
('PerkinElmer', 'PKI', 'Health Care', 'Health Care Equipment', 'Waltham, Massachusetts', '', NULL),
('Prologis', 'PLD', 'Real Estate', 'Industrial REITs', 'San Francisco, California', '', NULL),
('Philip Morris International', 'PM', 'Consumer Staples', 'Tobacco', 'New York, New York', '', NULL),
('PNC Financial Services', 'PNC', 'Financials', 'Regional Banks', 'Pittsburgh, Pennsylvania', '', NULL),
('Pentair plc', 'PNR', 'Industrials', 'Industrial Machinery', 'Worsley, UK', '', NULL),
('Pinnacle West Capital', 'PNW', 'Utilities', 'Multi-Utilities', 'Phoenix, Arizona', '1985', NULL),
('PPG Industries', 'PPG', 'Materials', 'Specialty Chemicals', 'Pittsburgh, Pennsylvania', '1883', NULL),
('PPL Corp.', 'PPL', 'Utilities', 'Electric Utilities', 'Allentown, Pennsylvania', '', NULL),
('Perrigo', 'PRGO', 'Health Care', 'Pharmaceuticals', 'Dublin, Ireland', '', NULL),
('Prudential Financial', 'PRU', 'Financials', 'Life & Health Insurance', 'Newark, New Jersey', '', NULL),
('Public Storage', 'PSA', 'Real Estate', 'Specialized REITs', 'Glendale, California', '', NULL),
('Phillips 66', 'PSX', 'Energy', 'Oil & Gas Refining & Marketing', 'Houston, Texas', '', NULL),
('PVH Corp.', 'PVH', 'Consumer Discretionary', 'Apparel, Accessories & Luxury Goods', 'New York, New York', '', NULL),
('Quanta Services Inc.', 'PWR', 'Industrials', 'Construction & Engineering', 'Houston, Texas', '', NULL),
('Pioneer Natural Resources', 'PXD', 'Energy', 'Oil & Gas Exploration & Production', 'Irving, Texas', '', NULL),
('PayPal', 'PYPL', 'Information Technology', 'Data Processing & Outsourced Services', 'San Jose, California', '', NULL),
('QUALCOMM Inc.', 'QCOM', 'Information Technology', 'Semiconductors', 'San Diego, California', '1985', NULL),
('Qorvo', 'QRVO', 'Information Technology', 'Semiconductors', 'Greensboro, North Carolina', '', NULL),
('Royal Caribbean Cruises Ltd', 'RCL', 'Consumer Discretionary', 'Hotels, Resorts & Cruise Lines', 'Miami, Florida', '', NULL),
('Everest Re Group Ltd.', 'RE', 'Financials', 'Reinsurance', 'Hamilton, Bermuda', '', NULL),
('Regency Centers Corporation', 'REG', 'Real Estate', 'Retail REITs', 'Jacksonville, Florida', '', NULL),
('Regeneron', 'REGN', 'Health Care', 'Biotechnology', 'Tarrytown, New York', '', NULL),
('Regions Financial Corp.', 'RF', 'Financials', 'Regional Banks', 'Birmingham, Alabama', '', NULL),
('Robert Half International', 'RHI', 'Industrials', 'Human Resource & Employment Services', 'Menlo Park, California', '', NULL),
('Red Hat Inc.', 'RHT', 'Information Technology', 'Systems Software', 'Raleigh, North Carolina', '', NULL),
('Raymond James Financial Inc.', 'RJF', 'Financials', 'Investment Banking & Brokerage', 'St. Petersburg, Florida', '', NULL),
('Polo Ralph Lauren Corp.', 'RL', 'Consumer Discretionary', 'Apparel, Accessories & Luxury Goods', 'New York, New York', '', NULL),
('ResMed', 'RMD', 'Health Care', 'Health Care Equipment', 'San Diego, California', '', NULL),
('Rockwell Automation Inc.', 'ROK', 'Industrials', 'Electrical Components & Equipment', 'Milwaukee, Wisconsin', '', NULL),
('Rollins Inc.', 'ROL', 'Industrials', 'Environmental & Facilities Services', 'Atlanta, Georgia', '', NULL),
('Roper Technologies', 'ROP', 'Industrials', 'Industrial Conglomerates', 'Sarasota, Florida', '', NULL),
('Ross Stores', 'ROST', 'Consumer Discretionary', 'Apparel Retail', 'Pleasanton, California', '', NULL),
('Republic Services Inc', 'RSG', 'Industrials', 'Environmental & Facilities Services', 'Phoenix, Arizona', '', NULL),
('Raytheon Co.', 'RTN', 'Industrials', 'Aerospace & Defense', 'Waltham, Massachusetts', '1922', NULL),
('SBA Communications', 'SBAC', 'Real Estate', 'Specialized REITs', 'Boca Raton, Florida', '', NULL),
('Starbucks Corp.', 'SBUX', 'Consumer Discretionary', 'Restaurants', 'Seattle, Washington', '1971', NULL),
('Charles Schwab Corporation', 'SCHW', 'Financials', 'Investment Banking & Brokerage', 'San Francisco, California', '', NULL),
('Sealed Air', 'SEE', 'Materials', 'Paper Packaging', 'Elmwood Park, New Jersey', '', NULL),
('Sherwin-Williams', 'SHW', 'Materials', 'Specialty Chemicals', 'Cleveland, Ohio', '1866', NULL),
('SVB Financial', 'SIVB', 'Financials', 'Regional Banks', 'Santa Clara, California', '', NULL),
('JM Smucker', 'SJM', 'Consumer Staples', 'Packaged Foods & Meats', 'Orrville, Ohio', '', NULL),
('Schlumberger Ltd.', 'SLB', 'Energy', 'Oil & Gas Equipment & Services', 'CuraÃ§ao,Â Kingdom of the Netherlands', '1926', NULL),
('SL Green Realty', 'SLG', 'Real Estate', 'Office REITs', 'New York, New York', '', NULL),
('Snap-on', 'SNA', 'Industrials', 'Industrial Machinery', 'Kenosha, Wisconsin', '', NULL),
('Synopsys Inc.', 'SNPS', 'Information Technology', 'Application Software', 'Mountain View, California', '', NULL),
('Southern Co.', 'SO', 'Utilities', 'Electric Utilities', 'Atlanta, Georgia', '', NULL),
('Simon Property Group Inc', 'SPG', 'Real Estate', 'Retail REITs', 'Indianapolis, Indiana', '', NULL),
('S&P Global, Inc.', 'SPGI', 'Financials', 'Financial Exchanges & Data', 'New York, New York', '', NULL),
('Sempra Energy', 'SRE', 'Utilities', 'Multi-Utilities', 'San Diego, California', '', NULL),
('SunTrust Banks', 'STI', 'Financials', 'Regional Banks', 'Atlanta, Georgia', '', NULL),
('State Street Corp.', 'STT', 'Financials', 'Asset Management & Custody Banks', 'Boston, Massachusetts', '', NULL),
('Seagate Technology', 'STX', 'Information Technology', 'Technology Hardware, Storage & Peripherals', 'Dublin, Ireland', '', NULL),
('Constellation Brands', 'STZ', 'Consumer Staples', 'Distillers & Vintners', 'Victor, New York', '', NULL),
('Stanley Black & Decker', 'SWK', 'Industrials', 'Industrial Machinery', 'New Britain, Connecticut', '', NULL),
('Skyworks Solutions', 'SWKS', 'Information Technology', 'Semiconductors', 'Woburn, Massachusetts', '', NULL),
('Synchrony Financial', 'SYF', 'Financials', 'Consumer Finance', 'Stamford, Connecticut', '', NULL),
('Stryker Corp.', 'SYK', 'Health Care', 'Health Care Equipment', 'Kalamazoo, Michigan', '', NULL),
('Symantec Corp.', 'SYMC', 'Information Technology', 'Application Software', 'Mountain View, California', '', NULL),
('Sysco Corp.', 'SYY', 'Consumer Staples', 'Food Distributors', 'Houston, Texas', '', NULL),
('AT&T Inc.', 'T', 'Communication Services', 'Integrated Telecommunication Services', 'Dallas, Texas', '1983', NULL),
('Molson Coors Brewing Company', 'TAP', 'Consumer Staples', 'Brewers', 'Denver, Colorado', '', NULL),
('TransDigm Group', 'TDG', 'Industrials', 'Aerospace & Defense', 'Cleveland, Ohio', '', NULL),
('TE Connectivity Ltd.', 'TEL', 'Information Technology', 'Electronic Manufacturing Services', 'Schaffhausen, Switzerland', '', NULL),
('Teleflex Inc', 'TFX', 'Health Care', 'Health Care Equipment', 'Wayne, Pennsylvania', '1943', NULL),
('Target Corp.', 'TGT', 'Consumer Discretionary', 'General Merchandise Stores', 'Minneapolis, Minnesota', '', NULL),
('Tiffany & Co.', 'TIF', 'Consumer Discretionary', 'Apparel, Accessories & Luxury Goods', 'New York, New York', '', NULL),
('TJX Companies Inc.', 'TJX', 'Consumer Discretionary', 'Apparel Retail', 'Framingham, Massachusetts', '', NULL),
('Torchmark Corp.', 'TMK', 'Financials', 'Life & Health Insurance', 'McKinney, Texas', '', NULL),
('Thermo Fisher Scientific', 'TMO', 'Health Care', 'Health Care Equipment', 'Waltham, Massachusetts', '2006', NULL),
('Tapestry, Inc.', 'TPR', 'Consumer Discretionary', 'Apparel, Accessories & Luxury Goods', 'New York, New York', '2017', NULL),
('TripAdvisor', 'TRIP', 'Communication Services', 'Interactive Media & Services', 'Newton, Massachusetts', '', NULL),
('T. Rowe Price Group', 'TROW', 'Financials', 'Asset Management & Custody Banks', 'Baltimore, Maryland', '1937', NULL),
('The Travelers Companies Inc.', 'TRV', 'Financials', 'Property & Casualty Insurance', 'New York, New York', '', NULL),
('Tractor Supply Company', 'TSCO', 'Consumer Discretionary', 'Specialty Stores', 'Brentwood, Tennessee', '', NULL),
('Tyson Foods', 'TSN', 'Consumer Staples', 'Packaged Foods & Meats', 'Springdale, Arkansas', '', NULL),
('Total System Services', 'TSS', 'Information Technology', 'Internet Software & Services', 'Columbus, Georgia', '', NULL),
('Take-Two Interactive', 'TTWO', 'Communication Services', 'Interactive Home Entertainment', 'New York, New York', '', NULL),
('Twitter, Inc.', 'TWTR', 'Communication Services', 'Interactive Media & Services', 'San Francisco, California', '', NULL),
('Texas Instruments', 'TXN', 'Information Technology', 'Semiconductors', 'Dallas, Texas', '1930', NULL),
('Textron Inc.', 'TXT', 'Industrials', 'Aerospace & Defense', 'Providence, Rhode Island', '', NULL),
('Under Armour Class C', 'UA', 'Consumer Discretionary', 'Apparel, Accessories & Luxury Goods', 'Baltimore, Maryland', '', NULL),
('Under Armour Class A', 'UAA', 'Consumer Discretionary', 'Apparel, Accessories & Luxury Goods', 'Baltimore, Maryland', '', NULL),
('United Continental Holdings', 'UAL', 'Industrials', 'Airlines', 'Chicago, Illinois', '', NULL),
('UDR Inc', 'UDR', 'Real Estate', 'Residential REITs', 'Highlands Ranch, Colorado', '', NULL),
('Universal Health Services, Inc.', 'UHS', 'Health Care', 'Health Care Facilities', 'King of Prussia, Pennsylvania', '', NULL),
('Ulta Beauty', 'ULTA', 'Consumer Discretionary', 'Specialty Stores', 'Bolingbrook, Illinois', '', NULL),
('United Health Group Inc.', 'UNH', 'Health Care', 'Managed Health Care', 'Minnetonka, Minnesota', '', NULL),
('Unum Group', 'UNM', 'Financials', 'Life & Health Insurance', 'Chattanooga, Tennessee', '', NULL),
('Union Pacific', 'UNP', 'Industrials', 'Railroads', 'Omaha, Nebraska', '', NULL),
('United Parcel Service', 'UPS', 'Industrials', 'Air Freight & Logistics', 'Atlanta, Georgia', '', NULL),
('United Rentals, Inc.', 'URI', 'Industrials', 'Trading Companies & Distributors', 'Stamford, Connecticut', '', NULL),
('U.S. Bancorp', 'USB', 'Financials', 'Diversified Banks', 'Minneapolis, Minnesota', '1968', NULL),
('United Technologies', 'UTX', 'Industrials', 'Aerospace & Defense', 'Hartford, Connecticut', '', NULL),
('Visa Inc.', 'V', 'Information Technology', 'IT Services', 'San Francisco, California', '', NULL),
('Varian Medical Systems', 'VAR', 'Health Care', 'Health Care Equipment', 'Palo Alto, California', '', NULL);
INSERT INTO `company` (`name`, `symbol`, `GICS`, `category`, `headquarter`, `founded`, `url`) VALUES
('V.F. Corp.', 'VFC', 'Consumer Discretionary', 'Apparel, Accessories & Luxury Goods', 'Greensboro, North Carolina', '', NULL),
('Viacom Inc.', 'VIAB', 'Communication Services', 'Movies & Entertainment', 'New York, New York', '', NULL),
('Valero Energy', 'VLO', 'Energy', 'Oil & Gas Refining & Marketing', 'San Antonio, Texas', '1980', NULL),
('Vulcan Materials', 'VMC', 'Materials', 'Construction Materials', 'Birmingham, Alabama', '', NULL),
('Vornado Realty Trust', 'VNO', 'Real Estate', 'Office REITs', 'New York, New York', '', NULL),
('Verisk Analytics', 'VRSK', 'Industrials', 'Research & Consulting Services', 'Jersey City, New Jersey', '', NULL),
('Verisign Inc.', 'VRSN', 'Information Technology', 'Internet Services & Infrastructure', 'Dulles, Virginia', '', NULL),
('Vertex Pharmaceuticals Inc', 'VRTX', 'Health Care', 'Biotechnology', 'Cambridge, Massachusetts', '', NULL),
('Ventas Inc', 'VTR', 'Real Estate', 'Health Care REITs', 'Chicago, Illinois', '', NULL),
('Verizon Communications', 'VZ', 'Communication Services', 'Integrated Telecommunication Services', 'New York, New York', '', NULL),
('Wabtec Corporation', 'WAB', 'Industrials', 'Construction Machinery & Heavy Trucks', 'Wilmerding, Pennsylvania', '', NULL),
('Waters Corporation', 'WAT', 'Health Care', 'Health Care Distributors', 'Milford, Massachusetts', '1958', NULL),
('Walgreens Boots Alliance', 'WBA', 'Consumer Staples', 'Drug Retail', 'Deerfield, Illinois', '', NULL),
('WellCare', 'WCG', 'Health Care', 'Managed Health Care', 'Tampa, Florida', '', NULL),
('Western Digital', 'WDC', 'Information Technology', 'Technology Hardware, Storage & Peripherals', 'Irvine, California', '', NULL),
('Wec Energy Group Inc', 'WEC', 'Utilities', 'Electric Utilities', 'Milwaukee, Wisconsin', '', NULL),
('Welltower Inc.', 'WELL', 'Real Estate', 'Health Care REITs', 'Toledo, Ohio', '', NULL),
('Wells Fargo', 'WFC', 'Financials', 'Diversified Banks', 'San Francisco, California', '', NULL),
('Whirlpool Corp.', 'WHR', 'Consumer Discretionary', 'Household Appliances', 'Benton Harbor, Michigan', '1911', NULL),
('Willis Towers Watson', 'WLTW', 'Financials', 'Insurance Brokers', 'London, United Kingdom', '', NULL),
('Waste Management Inc.', 'WM', 'Industrials', 'Environmental & Facilities Services', 'Houston, Texas', '1968', NULL),
('Williams Cos.', 'WMB', 'Energy', 'Oil & Gas Storage & Transportation', 'Tulsa, Oklahoma', '', NULL),
('Walmart', 'WMT', 'Consumer Staples', 'Hypermarkets & Super Centers', 'Bentonville, Arkansas', '', NULL),
('WestRock', 'WRK', 'Materials', 'Paper Packaging', 'Richmond, Virginia', '', NULL),
('Western Union Co', 'WU', 'Information Technology', 'Internet Software & Services', 'Englewood, Colorado', '1851', NULL),
('Weyerhaeuser', 'WY', 'Real Estate', 'Specialized REITS', 'Federal Way, Washington', '', NULL),
('Wynn Resorts Ltd', 'WYNN', 'Consumer Discretionary', 'Casinos & Gaming', 'Paradise, Nevada', '', NULL),
('Cimarex Energy', 'XEC', 'Energy', 'Oil & Gas Exploration & Production', 'Denver, Colorado', '', NULL),
('Xcel Energy Inc', 'XEL', 'Utilities', 'Multi-Utilities', 'Minneapolis, Minnesota', '1909', NULL),
('Xilinx', 'XLNX', 'Information Technology', 'Semiconductors', 'San Jose, California', '', NULL),
('Exxon Mobil Corp.', 'XOM', 'Energy', 'Integrated Oil & Gas', 'Irving, Texas', '1999', NULL),
('Dentsply Sirona', 'XRAY', 'Health Care', 'Health Care Supplies', 'York, Pennsylvania', '', NULL),
('Xerox', 'XRX', 'Information Technology', 'Technology Hardware, Storage & Peripherals', 'Norwalk, Connecticut', '1906', NULL),
('Xylem Inc.', 'XYL', 'Industrials', 'Industrial Machinery', 'White Plains, New York', '', NULL),
('Yum! Brands Inc', 'YUM', 'Consumer Discretionary', 'Restaurants', 'Louisville, Kentucky', '', NULL),
('Zimmer Biomet Holdings', 'ZBH', 'Health Care', 'Health Care Equipment', 'Warsaw, Indiana', '', NULL),
('Zions Bancorp', 'ZION', 'Financials', 'Regional Banks', 'Salt Lake City, Utah', '', NULL),
('Zoetis', 'ZTS', 'Health Care', 'Pharmaceuticals', 'Florham Park, New Jersey', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offset_trades`
--

CREATE TABLE `offset_trades` (
  `id` mediumint(9) NOT NULL,
  `account_id` mediumint(9) UNSIGNED NOT NULL,
  `settlement_date` datetime NOT NULL,
  `buy_id` bigint(20) NOT NULL,
  `sell_id` bigint(20) NOT NULL,
  `symbol` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `offset_qty` int(11) NOT NULL,
  `realized_pl` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `offset_trades`
--

INSERT INTO `offset_trades` (`id`, `account_id`, `settlement_date`, `buy_id`, `sell_id`, `symbol`, `offset_qty`, `realized_pl`) VALUES
(1, 2, '2019-04-22 00:00:00', 2, 6, 'AMZN', 50, '2100.00'),
(2, 3, '2019-04-22 00:00:00', 3, 7, 'AAPL', 100, '400.00'),
(3, 5, '2019-04-22 00:00:00', 5, 8, 'GOOG', 200, '5600.00');

-- --------------------------------------------------------

--
-- Table structure for table `open_trades`
--

CREATE TABLE `open_trades` (
  `id` mediumint(9) NOT NULL,
  `account_id` mediumint(9) UNSIGNED NOT NULL,
  `orig_trade_id` bigint(20) NOT NULL,
  `orig_trade_date` datetime NOT NULL,
  `symbol` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `buy_sell` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `trade_price` float NOT NULL,
  `open_qty` int(11) NOT NULL,
  `settlement_date` datetime DEFAULT NULL,
  `close_price` float DEFAULT NULL,
  `unrealized_pl` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `open_trades`
--

INSERT INTO `open_trades` (`id`, `account_id`, `orig_trade_id`, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty`, `settlement_date`, `close_price`, `unrealized_pl`) VALUES
(1, 2, 2, '2019-04-15 00:00:00', 'AMZN', 'B', 1845, 50, '2019-04-22 00:00:00', 1887.31, '2115.50'),
(2, 3, 3, '2019-04-15 00:00:00', 'AAPL', 'B', 200, 200, '2019-04-22 00:00:00', 204.53, '906.00'),
(3, 5, 5, '2019-04-15 00:00:00', 'GOOG', 'B', 1220, 300, '2019-04-22 00:00:00', 1248.84, '8652.00');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` mediumint(9) NOT NULL,
  `symbol` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime NOT NULL,
  `open` float NOT NULL,
  `high` float NOT NULL,
  `low` float NOT NULL,
  `price` float NOT NULL,
  `volume` int(11) NOT NULL,
  `latest_trade_day` date DEFAULT NULL,
  `previous_close` float DEFAULT NULL,
  `change_amount` float DEFAULT NULL,
  `change_percent` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `symbol`, `datetime`, `open`, `high`, `low`, `price`, `volume`, `latest_trade_day`, `previous_close`, `change_amount`, `change_percent`) VALUES
(1, 'A', '2019-04-24 12:24:05', 74.28, 76.62, 75.4306, 76.04, 1072363, '2019-04-24', 75.56, 0.48, 0.6353),
(2, 'AAL', '2019-04-23 15:59:02', 33.43, 34.17, 33.42, 33.97, 2942175, '2019-04-23', 33.48, 0.49, 1.4636),
(3, 'AAP', '2019-04-23 15:59:33', 171.09, 173.615, 170.26, 172.47, 857423, '2019-04-23', 170.08, 2.39, 1.4052);

-- --------------------------------------------------------

--
-- Table structure for table `stock_history`
--

CREATE TABLE `stock_history` (
  `symbol` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `open` float NOT NULL,
  `high` float NOT NULL,
  `low` float NOT NULL,
  `close` float NOT NULL,
  `volume` int(11) NOT NULL,
  `amount_change` float DEFAULT NULL,
  `percent_change` float DEFAULT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stock_history`
--

INSERT INTO `stock_history` (`symbol`, `date`, `open`, `high`, `low`, `close`, `volume`, `amount_change`, `percent_change`, `id`) VALUES
('A', '2019-04-24', 75.84, 76.62, 75.4306, 76.07, 1067929, NULL, NULL, 1),
('A', '2019-04-23', 74.28, 76.8, 73.76, 75.56, 4607089, NULL, NULL, 2),
('A', '2019-04-22', 75.93, 76.72, 75.13, 75.57, 2016043, NULL, NULL, 3),
('A', '2019-04-18', 75.73, 76.54, 75.31, 76.17, 2874195, NULL, NULL, 4),
('A', '2019-04-17', 78.15, 78.32, 74.46, 75.43, 4471971, NULL, NULL, 5),
('A', '2019-04-16', 80.82, 80.96, 77.19, 77.55, 3441597, NULL, NULL, 6),
('A', '2019-04-15', 81, 81.13, 79.905, 80.4, 1627268, NULL, NULL, 7),
('A', '2019-04-12', 81.43, 82.06, 80.9, 80.98, 1249295, NULL, NULL, 8),
('A', '2019-04-11', 81.88, 81.92, 80.89, 81.08, 1071479, NULL, NULL, 9),
('A', '2019-04-10', 81.45, 82.24, 81.45, 81.68, 982886, NULL, NULL, 10),
('A', '2019-04-09', 81.56, 81.72, 81.27, 81.42, 1254742, NULL, NULL, 11),
('A', '2019-04-08', 81.57, 81.71, 80.585, 81.69, 783350, NULL, NULL, 12),
('A', '2019-04-05', 81.19, 81.92, 81.05, 81.47, 1502875, NULL, NULL, 13),
('A', '2019-04-04', 81.84, 82.05, 80.44, 80.83, 2180112, NULL, NULL, 14),
('A', '2019-04-03', 81.54, 82.02, 81.46, 81.94, 2141025, NULL, NULL, 15),
('A', '2019-04-02', 81.71, 81.76, 81.03, 81.14, 1203037, NULL, NULL, 16),
('A', '2019-04-01', 80.96, 81.77, 80.96, 81.56, 1522681, NULL, NULL, 17),
('A', '2019-03-29', 80.16, 80.67, 79.95, 80.38, 1585137, NULL, NULL, 18),
('A', '2019-03-28', 79.39, 79.79, 78.71, 79.7, 1615615, NULL, NULL, 19),
('A', '2019-03-27', 80.5, 80.77, 78.885, 79, 1446133, NULL, NULL, 20),
('A', '2019-03-26', 80.39, 81.04, 80.13, 80.65, 1428157, NULL, NULL, 21),
('A', '2019-03-25', 79.09, 79.8554, 78.66, 79.52, 923006, NULL, NULL, 22),
('A', '2019-03-22', 81.54, 81.675, 78.97, 78.99, 1435825, NULL, NULL, 23),
('A', '2019-03-21', 80.55, 82.27, 80.55, 82, 986602, NULL, NULL, 24),
('A', '2019-03-20', 81.28, 81.445, 80.25, 80.92, 1768328, NULL, NULL, 25),
('A', '2019-03-19', 81.27, 81.77, 81.03, 81.2, 1172573, NULL, NULL, 26),
('A', '2019-03-18', 81.1, 81.29, 80.49, 80.97, 1617696, NULL, NULL, 27),
('A', '2019-03-15', 80.86, 81.43, 80.825, 81.1, 1999067, NULL, NULL, 28),
('A', '2019-03-14', 80.06, 80.67, 80.06, 80.61, 1268470, NULL, NULL, 29),
('A', '2019-03-13', 80.22, 80.74, 80.02, 80.13, 1529133, NULL, NULL, 30),
('A', '2019-03-12', 79.58, 80.13, 79.16, 79.93, 1532269, NULL, NULL, 31),
('A', '2019-03-11', 78.28, 79.47, 78.26, 79.3, 1210929, NULL, NULL, 32),
('A', '2019-03-08', 78.18, 78.24, 77.4, 77.98, 1483484, NULL, NULL, 33),
('A', '2019-03-07', 78.69, 79.1, 78.01, 78.73, 1818134, NULL, NULL, 34),
('A', '2019-03-06', 79.82, 79.98, 78.73, 78.75, 1750488, NULL, NULL, 35),
('A', '2019-03-05', 80.02, 80.03, 79.36, 79.74, 1405644, NULL, NULL, 36),
('A', '2019-03-04', 81.5, 81.76, 79.53, 80.13, 3204122, NULL, NULL, 37),
('A', '2019-03-01', 80, 81.445, 80, 81.24, 1625899, NULL, NULL, 38),
('A', '2019-02-28', 79.18, 79.75, 78.89, 79.44, 1759103, NULL, NULL, 39),
('A', '2019-02-27', 78.25, 79.55, 78.25, 79.42, 1254403, NULL, NULL, 40),
('A', '2019-02-26', 79.21, 79.27, 78.42, 78.55, 1992595, NULL, NULL, 41),
('A', '2019-02-25', 78.9, 79.84, 78.85, 79.34, 1878041, NULL, NULL, 42),
('A', '2019-02-22', 78.16, 78.46, 77.83, 78.42, 2797669, NULL, NULL, 43),
('A', '2019-02-21', 77.67, 78.58, 76.5, 77.89, 3570828, NULL, NULL, 44),
('A', '2019-02-20', 77.53, 78.795, 77.33, 78.56, 2076523, NULL, NULL, 45),
('A', '2019-02-19', 78, 78.32, 77.41, 77.52, 2967968, NULL, NULL, 46),
('A', '2019-02-15', 77.63, 78.31, 77.47, 78.3, 1919672, NULL, NULL, 47),
('A', '2019-02-14', 77, 77.28, 76.52, 77.02, 1618269, NULL, NULL, 48),
('A', '2019-02-13', 77.37, 77.49, 76.7441, 77.25, 1376358, NULL, NULL, 49),
('A', '2019-02-12', 76.8, 77.25, 76.43, 77.07, 2045501, NULL, NULL, 50),
('A', '2019-02-11', 76, 76.39, 75.7475, 76.08, 1018208, NULL, NULL, 51),
('A', '2019-02-08', 75.07, 75.81, 74.76, 75.8, 1318051, NULL, NULL, 52),
('A', '2019-02-07', 75.72, 76.12, 74.87, 75.33, 1660637, NULL, NULL, 53),
('A', '2019-02-06', 76.11, 76.69, 76, 76.3, 1504860, NULL, NULL, 54),
('A', '2019-02-05', 75.8, 76.51, 75.79, 76.31, 1593537, NULL, NULL, 55),
('A', '2019-02-04', 76.18, 76.23, 75.32, 76.03, 2245893, NULL, NULL, 56),
('A', '2019-02-01', 76.16, 76.59, 75.62, 76.04, 1343915, NULL, NULL, 57),
('A', '2019-01-31', 75.21, 76.31, 74.67, 76.05, 2951321, NULL, NULL, 58),
('A', '2019-01-30', 73.74, 75.59, 73.48, 75.44, 1679472, NULL, NULL, 59),
('A', '2019-01-29', 73.7, 74.06, 73.2, 73.56, 1684521, NULL, NULL, 60),
('A', '2019-01-28', 72.76, 73.28, 72.41, 73.27, 1729625, NULL, NULL, 61),
('A', '2019-01-25', 72.79, 73.73, 72.56, 73.65, 2215271, NULL, NULL, 62),
('A', '2019-01-24', 71.46, 72.2, 71.39, 72.18, 1509599, NULL, NULL, 63),
('A', '2019-01-23', 71.95, 72.85, 70.74, 71.65, 2050294, NULL, NULL, 64),
('A', '2019-01-22', 71.44, 71.48, 70.47, 71.32, 1972650, NULL, NULL, 65),
('A', '2019-01-18', 71.29, 72.31, 70.85, 71.93, 1551657, NULL, NULL, 66),
('A', '2019-01-17', 69.76, 71.24, 69.76, 70.82, 1225840, NULL, NULL, 67),
('A', '2019-01-16', 70.82, 71.13, 69.975, 70.03, 1480321, NULL, NULL, 68),
('A', '2019-01-15', 69.95, 70.75, 69.62, 70.6, 1793061, NULL, NULL, 69),
('A', '2019-01-14', 69.72, 70.29, 69.67, 69.75, 2182673, NULL, NULL, 70),
('A', '2019-01-11', 69.29, 70.41, 68.94, 70.38, 1210791, NULL, NULL, 71),
('A', '2019-01-10', 69.05, 69.95, 68.6, 69.9, 1080882, NULL, NULL, 72),
('A', '2019-01-09', 68.2, 69.66, 67.995, 69.25, 2442291, NULL, NULL, 73),
('A', '2019-01-08', 67.59, 68.21, 66.7, 67.83, 1578055, NULL, NULL, 74),
('A', '2019-01-07', 65.64, 67.425, 65.61, 66.85, 3235055, NULL, NULL, 75),
('A', '2019-01-04', 64.09, 65.95, 64.09, 65.46, 3123654, NULL, NULL, 76),
('A', '2019-01-03', 65.53, 65.78, 62, 63.27, 5383926, NULL, NULL, 77),
('A', '2019-01-02', 66.5, 66.57, 65.3, 65.69, 2113304, NULL, NULL, 78),
('A', '2018-12-31', 66.34, 67.48, 66.34, 67.46, 1572136, NULL, NULL, 79),
('A', '2018-12-28', 66.98, 67.12, 65.71, 65.96, 1927748, NULL, NULL, 80),
('A', '2018-12-27', 64.5, 66.5, 64, 66.48, 1655033, NULL, NULL, 81),
('A', '2018-12-26', 62.93, 65.58, 62.76, 65.54, 1701769, NULL, NULL, 82),
('A', '2018-12-24', 62.93, 63.63, 62.22, 62.67, 1668490, NULL, NULL, 83),
('A', '2018-12-21', 65.22, 66.23, 63.22, 63.29, 4683100, NULL, NULL, 84),
('A', '2018-12-20', 66.33, 66.46, 64.59, 65.19, 3547814, NULL, NULL, 85),
('A', '2018-12-19', 68.27, 69.09, 65.81, 66.83, 2845468, NULL, NULL, 86),
('A', '2018-12-18', 68.45, 69.03, 67.39, 67.99, 2111981, NULL, NULL, 87),
('A', '2018-12-17', 69.11, 69.625, 67.4, 67.85, 2241705, NULL, NULL, 88),
('A', '2018-12-14', 70.42, 70.61, 69.13, 69.36, 1982726, NULL, NULL, 89),
('A', '2018-12-13', 72.14, 72.68, 70.9, 71.14, 2200718, NULL, NULL, 90),
('A', '2018-12-12', 72.17, 73.04, 71.6, 71.75, 2842861, NULL, NULL, 91),
('A', '2018-12-11', 71.76, 72.44, 70.7, 71.05, 2926016, NULL, NULL, 92),
('A', '2018-12-10', 70.43, 70.71, 68.57, 70.59, 2347157, NULL, NULL, 93),
('A', '2018-12-07', 71.71, 72.09, 69.65, 70.25, 2184502, NULL, NULL, 94),
('A', '2018-12-06', 71.2, 71.93, 69.9, 71.91, 3505914, NULL, NULL, 95),
('A', '2018-12-04', 74.7, 75.115, 72.63, 72.91, 4263802, NULL, NULL, 96),
('A', '2018-12-03', 73.33, 74.79, 73.19, 74.67, 4265221, NULL, NULL, 97),
('A', '2018-11-30', 71.63, 72.645, 71.34, 72.35, 2279473, NULL, NULL, 98),
('A', '2018-11-29', 71.23, 72.18, 71.23, 71.57, 2625819, NULL, NULL, 99),
('A', '2018-11-28', 69.82, 71.485, 69.43, 71.48, 2661339, NULL, NULL, 100),
('A', '2018-11-27', 68.87, 69.52, 68.7, 69.36, 2533581, NULL, NULL, 101),
('A', '2018-11-26', 68.94, 69.3, 68.39, 69.25, 2406265, NULL, NULL, 102),
('A', '2018-11-23', 67.04, 68.61, 67.04, 68.21, 1374274, NULL, NULL, 103),
('A', '2018-11-21', 67.66, 68.67, 67.19, 67.72, 3557551, NULL, NULL, 104),
('A', '2018-11-20', 66.25, 68.4324, 64.93, 67.52, 8187326, NULL, NULL, 105),
('A', '2018-11-19', 64.67, 64.96, 62.4, 62.61, 3392057, NULL, NULL, 106),
('A', '2018-11-16', 64.38, 65.6, 64.38, 64.99, 2963305, NULL, NULL, 107),
('A', '2018-11-15', 63.32, 64.95, 62.54, 64.72, 3846090, NULL, NULL, 108),
('A', '2018-11-14', 64.64, 64.84, 63.28, 63.47, 4852556, NULL, NULL, 109),
('A', '2018-11-13', 64.59, 65.47, 63.94, 64.34, 2216456, NULL, NULL, 110),
('A', '2018-11-12', 66.16, 66.25, 64.45, 64.5, 2999960, NULL, NULL, 111),
('A', '2018-11-09', 67.6, 67.76, 66.7, 67.27, 2573534, NULL, NULL, 112),
('A', '2018-11-08', 67.99, 68.36, 67.38, 67.79, 2444607, NULL, NULL, 113),
('A', '2018-11-07', 66.51, 68.38, 66.275, 68.26, 2700613, NULL, NULL, 114),
('A', '2018-11-06', 66.04, 66.42, 65.67, 65.98, 2287255, NULL, NULL, 115),
('A', '2018-11-05', 66.03, 66.39, 65.23, 65.91, 2348704, NULL, NULL, 116),
('A', '2018-11-02', 65.8, 66.61, 65.435, 65.93, 2272114, NULL, NULL, 117),
('A', '2018-11-01', 65.07, 65.34, 64.585, 65.22, 1882438, NULL, NULL, 118),
('A', '2018-10-31', 64.35, 65.98, 64.19, 64.79, 3820987, NULL, NULL, 119),
('A', '2018-10-30', 62.35, 63.72, 61.68, 63.64, 3076720, NULL, NULL, 120),
('A', '2018-10-29', 63.65, 64.17, 61.13, 62.08, 2919874, NULL, NULL, 121),
('A', '2018-10-26', 61.82, 63.11, 61.13, 62.73, 3119947, NULL, NULL, 122),
('A', '2018-10-25', 61.49, 62.89, 61.07, 62.61, 3318277, NULL, NULL, 123),
('A', '2018-10-24', 62.92, 63.76, 61.01, 61.13, 3481246, NULL, NULL, 124),
('A', '2018-10-23', 62.82, 63.13, 61.38, 62.73, 4219761, NULL, NULL, 125),
('A', '2018-10-22', 64.69, 64.84, 63.54, 64.28, 2227932, NULL, NULL, 126),
('A', '2018-10-19', 65.81, 66.24, 64.24, 64.47, 2418302, NULL, NULL, 127),
('A', '2018-10-18', 67.12, 67.2, 65.255, 65.75, 2327330, NULL, NULL, 128),
('A', '2018-10-17', 67.17, 67.46, 66.31, 67.2, 1991212, NULL, NULL, 129),
('A', '2018-10-16', 66.25, 67.57, 65.99, 67.46, 1868279, NULL, NULL, 130),
('A', '2018-10-15', 65.92, 66.35, 65.36, 65.63, 1602860, NULL, NULL, 131),
('A', '2018-10-12', 66.1, 67.03, 65.3, 66.24, 3669509, NULL, NULL, 132),
('A', '2018-10-11', 66.64, 66.97, 64.62, 64.89, 3624612, NULL, NULL, 133),
('A', '2018-10-10', 69.41, 69.41, 66.61, 66.67, 3055653, NULL, NULL, 134),
('A', '2018-10-09', 69.34, 69.625, 68.71, 69.41, 2179198, NULL, NULL, 135),
('A', '2018-10-08', 69.96, 70.05, 68.9697, 69.5, 2179365, NULL, NULL, 136),
('A', '2018-10-05', 70.67, 71.18, 69.45, 70.3, 2376806, NULL, NULL, 137),
('A', '2018-10-04', 71.92, 72.13, 70.48, 70.66, 2961931, NULL, NULL, 138),
('A', '2018-10-03', 71.68, 72.37, 71.6, 72.12, 3203130, NULL, NULL, 139),
('A', '2018-10-02', 71.24, 71.73, 70.98, 71.68, 2617455, NULL, NULL, 140),
('A', '2018-10-01', 70.68, 71.576, 70.645, 71.26, 2837493, NULL, NULL, 141),
('A', '2018-09-28', 70.69, 70.995, 70.46, 70.54, 2248094, NULL, NULL, 142),
('A', '2018-09-27', 70.58, 70.85, 70.1, 70.8, 1581665, NULL, NULL, 143),
('A', '2018-09-26', 70.57, 70.99, 70.05, 70.33, 1830443, NULL, NULL, 144),
('A', '2018-09-25', 70.17, 70.835, 69.91, 70.38, 2090165, NULL, NULL, 145),
('A', '2018-09-24', 70.68, 70.68, 69.7, 69.95, 2333572, NULL, NULL, 146),
('A', '2018-09-21', 71.43, 71.46, 70.56, 70.72, 3119673, NULL, NULL, 147),
('A', '2018-09-20', 69.73, 71.16, 69.7, 71.13, 2865626, NULL, NULL, 148),
('A', '2018-09-19', 69.04, 69.64, 68.875, 69.56, 1183395, NULL, NULL, 149),
('A', '2018-09-18', 69.1, 69.27, 68.41, 68.93, 1780417, NULL, NULL, 150),
('A', '2018-09-17', 69.64, 69.66, 69, 69.08, 1816610, NULL, NULL, 151),
('A', '2018-09-14', 69.28, 69.41, 68.56, 68.85, 1461065, NULL, NULL, 152),
('A', '2018-09-13', 68.1, 69.66, 67.99, 69.33, 2495037, NULL, NULL, 153),
('A', '2018-09-12', 67.6, 68.005, 67.25, 67.91, 1125411, NULL, NULL, 154),
('A', '2018-09-11', 67.7, 68.06, 67.49, 67.62, 1676778, NULL, NULL, 155),
('A', '2018-09-10', 67.82, 68.41, 67.72, 67.93, 2065707, NULL, NULL, 156),
('A', '2018-09-07', 67.15, 67.83, 67.03, 67.4, 1585499, NULL, NULL, 157),
('A', '2018-09-06', 67, 67.55, 66.83, 67.36, 1031539, NULL, NULL, 158),
('A', '2018-09-05', 67.28, 67.4, 66.76, 66.96, 1859604, NULL, NULL, 159),
('A', '2018-09-04', 67.34, 67.56, 66.85, 67.27, 1727990, NULL, NULL, 160),
('A', '2018-08-31', 67.14, 67.55, 67.05, 67.54, 1582405, NULL, NULL, 161),
('A', '2018-08-30', 67, 67.65, 66.86, 67.26, 2246705, NULL, NULL, 162),
('A', '2018-08-29', 66.69, 67.28, 66.4, 67.01, 1852130, NULL, NULL, 163),
('A', '2018-08-28', 66.41, 67.3, 66.35, 66.69, 2284317, NULL, NULL, 164),
('A', '2018-08-27', 66.33, 66.35, 65.86, 66.08, 1158772, NULL, NULL, 165),
('A', '2018-08-24', 65.74, 66.26, 65.59, 65.98, 1904191, NULL, NULL, 166),
('A', '2018-08-23', 65.69, 65.99, 65.53, 65.69, 2287703, NULL, NULL, 167),
('A', '2018-08-22', 64.74, 65.87, 64.55, 65.65, 2565558, NULL, NULL, 168),
('A', '2018-08-21', 64.74, 65.4, 64.62, 64.93, 2982791, NULL, NULL, 169),
('A', '2018-08-20', 64.57, 65.11, 64.46, 64.47, 1619930, NULL, NULL, 170),
('A', '2018-08-17', 65.48, 65.48, 64.28, 64.66, 2449200, NULL, NULL, 171),
('A', '2018-08-16', 65.04, 65.67, 64.81, 65.5, 3149532, NULL, NULL, 172),
('A', '2018-08-15', 65.94, 66.39, 64.22, 64.73, 6071456, NULL, NULL, 173),
('A', '2018-08-14', 66.05, 67.26, 66.05, 66.75, 3110109, NULL, NULL, 174),
('A', '2018-08-13', 66.44, 66.99, 65.67, 65.94, 2989306, NULL, NULL, 175),
('A', '2018-08-10', 66.82, 66.87, 65.93, 66.26, 2166251, NULL, NULL, 176),
('A', '2018-08-09', 67.48, 67.62, 66.61, 66.69, 1727776, NULL, NULL, 177),
('A', '2018-08-08', 67.74, 68.15, 67.34, 67.38, 1682000, NULL, NULL, 178),
('A', '2018-08-07', 66.83, 67.94, 66.63, 67.66, 2829039, NULL, NULL, 179),
('A', '2018-08-06', 65.7, 66.66, 65.33, 66.51, 2873080, NULL, NULL, 180),
('A', '2018-08-03', 65.5, 65.79, 64.96, 65.73, 1857308, NULL, NULL, 181),
('A', '2018-08-02', 64.75, 65.39, 64.5, 65.29, 2263190, NULL, NULL, 182),
('A', '2018-08-01', 65.84, 66.17, 64.63, 64.98, 2679180, NULL, NULL, 183),
('A', '2018-07-31', 64.93, 66.685, 64.535, 66.04, 2539265, NULL, NULL, 184),
('A', '2018-07-30', 65.87, 66.07, 64.51, 64.63, 1601219, NULL, NULL, 185),
('A', '2018-07-27', 66.65, 66.77, 65.36, 65.75, 2638902, NULL, NULL, 186),
('A', '2018-07-26', 66, 66.83, 65.82, 66.75, 2583476, NULL, NULL, 187),
('A', '2018-07-25', 65.14, 66.04, 64.84, 65.96, 2924515, NULL, NULL, 188),
('A', '2018-07-24', 63.94, 65.35, 63.69, 64.79, 2454398, NULL, NULL, 189),
('A', '2018-07-23', 63.7, 64, 63.37, 63.72, 1417517, NULL, NULL, 190),
('A', '2018-07-20', 63.83, 64.33, 63.68, 63.85, 1620195, NULL, NULL, 191),
('A', '2018-07-19', 63.61, 64.65, 63.4, 64.15, 1726698, NULL, NULL, 192),
('A', '2018-07-18', 63.03, 63.23, 62.75, 62.99, 1202284, NULL, NULL, 193),
('A', '2018-07-17', 62.52, 63.26, 62.15, 63.04, 1469834, NULL, NULL, 194),
('A', '2018-07-16', 63.23, 63.23, 62.63, 62.72, 929264, NULL, NULL, 195),
('A', '2018-07-13', 63.52, 63.83, 63.21, 63.38, 963652, NULL, NULL, 196),
('A', '2018-07-12', 63.33, 63.78, 63.29, 63.45, 1748125, NULL, NULL, 197),
('A', '2018-07-11', 62.59, 63.28, 62.59, 62.86, 1780485, NULL, NULL, 198),
('A', '2018-07-10', 63.37, 63.74, 63.07, 63.67, 1924366, NULL, NULL, 199),
('A', '2018-07-09', 62.43, 63.315, 62.43, 63.12, 1508550, NULL, NULL, 200),
('A', '2018-07-06', 61.92, 62.4, 61.65, 62.29, 2269660, NULL, NULL, 201),
('A', '2018-07-05', 61.48, 61.89, 60.91, 61.8, 2247532, NULL, NULL, 202),
('A', '2018-07-03', 61.93, 62.09, 61.06, 61.25, 864379, NULL, NULL, 203),
('A', '2018-07-02', 61.36, 61.48, 60.79, 61.47, 1526468, NULL, NULL, 204),
('A', '2018-06-29', 61.68, 62.465, 61.57, 61.84, 1942768, NULL, NULL, 205),
('A', '2018-06-28', 61.13, 61.64, 60.42, 61.29, 1564067, NULL, NULL, 206),
('A', '2018-06-27', 62.26, 63, 61.1, 61.14, 2025823, NULL, NULL, 207),
('A', '2018-06-26', 61.23, 62.32, 61.02, 61.98, 3655622, NULL, NULL, 208),
('A', '2018-06-25', 62.46, 62.69, 60.8, 61.2, 2426792, NULL, NULL, 209),
('A', '2018-06-22', 63.58, 63.69, 62.73, 62.79, 3621863, NULL, NULL, 210),
('A', '2018-06-21', 62.81, 63.22, 62.27, 63.04, 4319387, NULL, NULL, 211),
('A', '2018-06-20', 63.54, 63.569, 62.63, 62.79, 4942091, NULL, NULL, 212),
('A', '2018-06-19', 64.22, 64.45, 63.2, 63.52, 4621382, NULL, NULL, 213),
('A', '2018-06-18', 65.48, 65.54, 64.53, 64.97, 2563129, NULL, NULL, 214),
('A', '2018-06-15', 66.11, 66.24, 65.19, 66.13, 4113230, NULL, NULL, 215),
('A', '2018-06-14', 66.45, 66.45, 65.71, 66.31, 3487894, NULL, NULL, 216),
('A', '2018-06-13', 66.6, 66.68, 65.97, 66.26, 4357708, NULL, NULL, 217),
('A', '2018-06-12', 65.97, 66.55, 65.63, 66.32, 2006950, NULL, NULL, 218),
('A', '2018-06-11', 65.68, 66.75, 65.59, 66.13, 3316711, NULL, NULL, 219),
('A', '2018-06-08', 65.35, 66.37, 65.15, 65.73, 3853848, NULL, NULL, 220),
('A', '2018-06-07', 65.41, 66.09, 64.8, 65.23, 2977186, NULL, NULL, 221),
('A', '2018-06-06', 63.75, 65.19, 63.06, 65.19, 3177630, NULL, NULL, 222),
('A', '2018-06-05', 63.46, 63.87, 63.09, 63.52, 1889520, NULL, NULL, 223),
('A', '2018-06-04', 63.17, 63.51, 62.76, 63.38, 1958048, NULL, NULL, 224),
('A', '2018-06-01', 62.47, 63.23, 62.44, 62.78, 2277946, NULL, NULL, 225),
('A', '2018-05-31', 62.65, 62.83, 61.85, 61.92, 2510357, NULL, NULL, 226),
('A', '2018-05-30', 62.24, 63.06, 61.995, 62.69, 1731482, NULL, NULL, 227),
('A', '2018-05-29', 62.63, 62.67, 61.3, 61.85, 3559198, NULL, NULL, 228),
('A', '2018-05-25', 63.94, 64.11, 62.84, 63.15, 1742002, NULL, NULL, 229),
('A', '2018-05-24', 64.62, 65, 64.07, 64.12, 1525894, NULL, NULL, 230),
('A', '2018-05-23', 64.21, 65, 64.21, 64.53, 3222446, NULL, NULL, 231),
('A', '2018-05-22', 65.62, 65.89, 64.685, 64.84, 3415571, NULL, NULL, 232),
('A', '2018-05-21', 64.75, 65.99, 64.68, 65.55, 4527295, NULL, NULL, 233),
('A', '2018-05-18', 63.63, 64.5999, 63.511, 64.32, 4163534, NULL, NULL, 234),
('A', '2018-05-17', 61.98, 63.9054, 61.76, 63.59, 5211271, NULL, NULL, 235),
('A', '2018-05-16', 62.51, 62.9883, 61.65, 61.94, 5872508, NULL, NULL, 236),
('A', '2018-05-15', 61.84, 64.1, 60.7, 62.5, 14451191, NULL, NULL, 237),
('A', '2018-05-14', 69.73, 70.45, 69, 69.21, 3322635, NULL, NULL, 238),
('A', '2018-05-11', 69.19, 69.6, 68.91, 69.45, 1524184, NULL, NULL, 239),
('A', '2018-05-10', 68.12, 68.88, 68.12, 68.86, 1844868, NULL, NULL, 240),
('A', '2018-05-09', 67.38, 68.41, 67.15, 68.13, 2108506, NULL, NULL, 241),
('A', '2018-05-08', 67.08, 67.435, 66.84, 67.37, 1916103, NULL, NULL, 242),
('A', '2018-05-07', 67.16, 67.98, 67.07, 67.39, 1468735, NULL, NULL, 243),
('A', '2018-05-04', 66.03, 67.25, 65.54, 67, 1331017, NULL, NULL, 244),
('A', '2018-05-03', 65.77, 66.46, 64.86, 66.34, 2365851, NULL, NULL, 245),
('A', '2018-05-02', 66, 66.86, 65.77, 65.91, 2240482, NULL, NULL, 246),
('A', '2018-05-01', 65.63, 66.35, 65.49, 66.24, 3135146, NULL, NULL, 247),
('A', '2018-04-30', 66.49, 66.66, 65.73, 65.74, 2277705, NULL, NULL, 248),
('A', '2018-04-27', 66.34, 66.56, 65.96, 66.28, 1189195, NULL, NULL, 249),
('A', '2018-04-26', 66.22, 66.76, 65.895, 66.37, 1978569, NULL, NULL, 250),
('A', '2018-04-25', 66.69, 67.08, 64.91, 65.8, 3873833, NULL, NULL, 251),
('A', '2018-04-24', 66.39, 67.905, 66.04, 66.64, 3701595, NULL, NULL, 252),
('A', '2018-04-23', 67.71, 68.67, 67.53, 68.07, 2260555, NULL, NULL, 253),
('A', '2018-04-20', 68.04, 68.26, 67.32, 67.55, 1917243, NULL, NULL, 254),
('A', '2018-04-19', 69.48, 69.59, 67.36, 67.97, 2435090, NULL, NULL, 255),
('A', '2018-04-18', 69.12, 70.29, 68.65, 69.55, 2678311, NULL, NULL, 256),
('A', '2018-04-17', 68.6, 68.85, 68.07, 68.44, 2682621, NULL, NULL, 257),
('A', '2018-04-16', 67.83, 68.37, 67.49, 68.17, 2887820, NULL, NULL, 258),
('A', '2018-04-13', 67.5, 67.67, 66.88, 67.21, 2043908, NULL, NULL, 259),
('A', '2018-04-12', 66.56, 67.64, 66.4535, 67.2, 2180892, NULL, NULL, 260),
('A', '2018-04-11', 65.98, 66.6, 65.82, 66.08, 1391380, NULL, NULL, 261),
('A', '2018-04-10', 66.14, 66.79, 65.9, 66.64, 2120887, NULL, NULL, 262),
('A', '2018-04-09', 64.92, 66.25, 64.08, 65.19, 2639750, NULL, NULL, 263),
('A', '2018-04-06', 65.01, 65.56, 63.38, 63.65, 3578587, NULL, NULL, 264),
('A', '2018-04-05', 65.82, 66.31, 65.5, 65.68, 2120181, NULL, NULL, 265),
('A', '2018-04-04', 64.15, 65.645, 63.645, 65.45, 5084054, NULL, NULL, 266),
('A', '2018-04-03', 64.94, 65.88, 64.62, 65.42, 2286132, NULL, NULL, 267),
('A', '2018-04-02', 66.65, 66.97, 63.73, 64.43, 3085753, NULL, NULL, 268),
('A', '2018-03-29', 66.75, 67.58, 66.11, 66.9, 2711285, NULL, NULL, 269),
('A', '2018-03-28', 67.22, 67.38, 65.81, 66.4, 2267763, NULL, NULL, 270),
('A', '2018-03-27', 68.48, 68.63, 66.54, 67, 2018736, NULL, NULL, 271),
('A', '2018-03-26', 67.2, 68.285, 66.655, 68.2, 1601171, NULL, NULL, 272),
('A', '2018-03-23', 67.58, 68.15, 65.94, 66.06, 1803736, NULL, NULL, 273),
('A', '2018-03-22', 68.7, 69.2, 67.33, 67.47, 1667733, NULL, NULL, 274),
('A', '2018-03-21', 69.88, 70.09, 69.36, 69.4, 1558358, NULL, NULL, 275),
('A', '2018-03-20', 69.77, 70.07, 69.45, 69.85, 2355102, NULL, NULL, 276),
('A', '2018-03-19', 69.79, 70.31, 69.06, 69.34, 2501900, NULL, NULL, 277),
('A', '2018-03-16', 69.92, 70.34, 69.05, 69.9, 3301577, NULL, NULL, 278),
('A', '2018-03-15', 70.09, 70.66, 69.87, 70.18, 2490222, NULL, NULL, 279),
('A', '2018-03-14', 71.07, 71.16, 69.6907, 69.92, 1825085, NULL, NULL, 280),
('A', '2018-03-13', 71, 71.52, 70.42, 70.68, 1573113, NULL, NULL, 281),
('A', '2018-03-12', 71.2, 71.53, 70.67, 70.71, 1858146, NULL, NULL, 282),
('A', '2018-03-09', 70.27, 71.5, 70, 71.13, 1869878, NULL, NULL, 283),
('A', '2018-03-08', 69.72, 70.27, 69.19, 69.85, 2365939, NULL, NULL, 284),
('A', '2018-03-07', 67.36, 69.855, 67.3, 69.7, 3125788, NULL, NULL, 285),
('A', '2018-03-06', 67.78, 68.42, 67.45, 68.11, 2942050, NULL, NULL, 286),
('A', '2018-03-05', 67.25, 67.85, 66.51, 67.55, 1890858, NULL, NULL, 287),
('A', '2018-03-02', 66.82, 67.68, 66.65, 67.51, 2057260, NULL, NULL, 288),
('A', '2018-03-01', 68.47, 68.8, 66.79, 67.38, 2401795, NULL, NULL, 289),
('A', '2018-02-28', 69.42, 70, 68.57, 68.59, 2657196, NULL, NULL, 290),
('A', '2018-02-27', 70.75, 70.92, 69, 69, 3277061, NULL, NULL, 291),
('A', '2018-02-26', 71, 71.21, 70.01, 70.58, 5422043, NULL, NULL, 292),
('A', '2018-02-23', 71.15, 71.37, 70.06, 70.7, 3878648, NULL, NULL, 293),
('A', '2018-02-22', 71.72, 71.76, 70.51, 70.68, 2290240, NULL, NULL, 294),
('A', '2018-02-21', 71.12, 72.7, 70.97, 71.25, 1989132, NULL, NULL, 295),
('A', '2018-02-20', 71.5, 71.85, 70.7, 71.08, 2577134, NULL, NULL, 296),
('A', '2018-02-16', 71.97, 72.7, 71.6207, 71.97, 2621697, NULL, NULL, 297),
('A', '2018-02-15', 74.94, 74.99, 71.22, 72.02, 4884299, NULL, NULL, 298),
('A', '2018-02-14', 67.8, 69.89, 67.62, 69.7, 3609450, NULL, NULL, 299),
('A', '2018-02-13', 67.97, 68.49, 67.66, 68.34, 1570583, NULL, NULL, 300),
('A', '2018-02-12', 67.46, 69.05, 67.37, 68.43, 4166983, NULL, NULL, 301);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL,
  `account_id` mediumint(9) UNSIGNED NOT NULL,
  `trade_date` datetime NOT NULL,
  `symbol` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `buy_sell` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `trade_price` float NOT NULL,
  `quantity` mediumint(9) NOT NULL,
  `status` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `account_id`, `trade_date`, `symbol`, `buy_sell`, `trade_price`, `quantity`, `status`, `amount`) VALUES
(1, 1, '2019-04-15 00:00:00', 'MSFT', 'B', 121, 100, 'Open', '-12100.00'),
(2, 2, '2019-04-15 00:00:00', 'AMZN', 'B', 1845, 100, 'Offset', '-184500.00'),
(3, 3, '2019-04-15 00:00:00', 'AAPL', 'B', 200, 300, 'Offset', '-60000.00'),
(4, 4, '2019-04-15 00:00:00', 'FB', 'B', 180, 200, 'Open', '-36000.00'),
(5, 5, '2019-04-15 00:00:00', 'GOOG', 'B', 1220, 500, 'Offset', '-610000.00'),
(6, 2, '2019-04-22 00:00:00', 'AMZN', 'S', 1887, 50, 'Closed', '94350.00'),
(7, 3, '2019-04-22 00:00:00', 'AAPL', 'S', 204, 100, 'Closed', '20400.00'),
(8, 5, '2019-04-22 00:00:00', 'GOOG', 'S', 1248, 200, 'Closed', '249600.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `account_watchlist`
--
ALTER TABLE `account_watchlist`
  ADD KEY `account_id` (`account_id`),
  ADD KEY `symbol` (`symbol`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`symbol`);

--
-- Indexes for table `offset_trades`
--
ALTER TABLE `offset_trades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offset_trades_fk1` (`buy_id`),
  ADD KEY `offset_trades_fk2` (`sell_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `open_trades`
--
ALTER TABLE `open_trades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `open_trades_fk1` (`orig_trade_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_fk0` (`symbol`);

--
-- Indexes for table `stock_history`
--
ALTER TABLE `stock_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_history_fk0` (`symbol`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_fk1` (`symbol`),
  ADD KEY `account_id` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `offset_trades`
--
ALTER TABLE `offset_trades`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `open_trades`
--
ALTER TABLE `open_trades`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stock_history`
--
ALTER TABLE `stock_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_watchlist`
--
ALTER TABLE `account_watchlist`
  ADD CONSTRAINT `account_watchlist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `account_watchlist_ibfk_2` FOREIGN KEY (`symbol`) REFERENCES `company` (`symbol`);

--
-- Constraints for table `offset_trades`
--
ALTER TABLE `offset_trades`
  ADD CONSTRAINT `offset_trades_fk1` FOREIGN KEY (`buy_id`) REFERENCES `transaction` (`id`),
  ADD CONSTRAINT `offset_trades_fk2` FOREIGN KEY (`sell_id`) REFERENCES `transaction` (`id`),
  ADD CONSTRAINT `offset_trades_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `open_trades`
--
ALTER TABLE `open_trades`
  ADD CONSTRAINT `open_trades_fk1` FOREIGN KEY (`orig_trade_id`) REFERENCES `transaction` (`id`),
  ADD CONSTRAINT `open_trades_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_fk0` FOREIGN KEY (`symbol`) REFERENCES `company` (`symbol`);

--
-- Constraints for table `stock_history`
--
ALTER TABLE `stock_history`
  ADD CONSTRAINT `stock_history_fk0` FOREIGN KEY (`symbol`) REFERENCES `company` (`symbol`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_fk1` FOREIGN KEY (`symbol`) REFERENCES `company` (`symbol`),
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);
