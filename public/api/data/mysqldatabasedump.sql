-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2019 at 01:40 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `investment`
--
CREATE DATABASE IF NOT EXISTS `investment` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `investment`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--
-- Creation: Apr 22, 2019 at 04:00 PM
--

DROP TABLE IF EXISTS `account`;
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
-- RELATIONSHIPS FOR TABLE `account`:
--

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
-- Table structure for table `company`
--
-- Creation: Apr 22, 2019 at 09:25 PM
--

DROP TABLE IF EXISTS `company`;
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
-- RELATIONSHIPS FOR TABLE `company`:
--

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
-- Creation: Apr 22, 2019 at 09:34 AM
--

DROP TABLE IF EXISTS `offset_trades`;
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
-- RELATIONSHIPS FOR TABLE `offset_trades`:
--   `buy_id`
--       `transaction` -> `id`
--   `sell_id`
--       `transaction` -> `id`
--   `account_id`
--       `account` -> `account_id`
--

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
-- Creation: Apr 22, 2019 at 09:34 AM
--

DROP TABLE IF EXISTS `open_trades`;
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
-- RELATIONSHIPS FOR TABLE `open_trades`:
--   `orig_trade_id`
--       `transaction` -> `id`
--   `account_id`
--       `account` -> `account_id`
--

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
-- Creation: Apr 22, 2019 at 09:34 AM
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `symbol` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime NOT NULL,
  `open` float NOT NULL,
  `high` float NOT NULL,
  `low` float NOT NULL,
  `close` float NOT NULL,
  `volume` int(11) NOT NULL,
  `id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `stock`:
--   `symbol`
--       `company` -> `symbol`
--

-- --------------------------------------------------------

--
-- Table structure for table `stock_history`
--
-- Creation: Apr 22, 2019 at 09:34 AM
--

DROP TABLE IF EXISTS `stock_history`;
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
-- RELATIONSHIPS FOR TABLE `stock_history`:
--   `symbol`
--       `company` -> `symbol`
--

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--
-- Creation: Apr 22, 2019 at 09:29 PM
--

DROP TABLE IF EXISTS `transaction`;
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
-- RELATIONSHIPS FOR TABLE `transaction`:
--   `symbol`
--       `company` -> `symbol`
--   `account_id`
--       `account` -> `account_id`
--

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
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_history`
--
ALTER TABLE `stock_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;