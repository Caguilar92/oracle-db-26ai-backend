-- Seeds the tables recreated by schema.sql with fictional demo data.
-- 10 assets and 100 maintenance requests (10 per asset).
-- Distinct fictional patrol, operator and technician notes; repeat incidents have separate context.
-- Spring SQL initialization separator is configured as a slash.

-- Parent assets are loaded before their maintenance requests.

INSERT INTO ASSET (ASSET_ID, ASSET_NAME, ASSET_TYPE, LOCATION, MODEL)
VALUES ('TX-104', 'North feeder transformer', 'TRANSFORMER', 'North Substation · Feeder 4', 'TX-2500')
/

INSERT INTO ASSET (ASSET_ID, ASSET_NAME, ASSET_TYPE, LOCATION, MODEL)
VALUES ('TX-207', 'East feeder transformer', 'TRANSFORMER', 'East Substation · Feeder 2', 'TX-2500')
/

INSERT INTO ASSET (ASSET_ID, ASSET_NAME, ASSET_TYPE, LOCATION, MODEL)
VALUES ('LINE-12', 'Riverside overhead line', 'POWERLINE', 'North district · Riverside corridor', 'Overhead distribution line')
/

INSERT INTO ASSET (ASSET_ID, ASSET_NAME, ASSET_TYPE, LOCATION, MODEL)
VALUES ('LINE-28', 'Industrial park line', 'POWERLINE', 'East district · Industrial park', 'Overhead distribution line')
/

INSERT INTO ASSET (ASSET_ID, ASSET_NAME, ASSET_TYPE, LOCATION, MODEL)
VALUES ('POLE-118', 'Riverside support pole', 'POLE', 'Riverside corridor · Span 18', 'Wood distribution pole')
/

INSERT INTO ASSET (ASSET_ID, ASSET_NAME, ASSET_TYPE, LOCATION, MODEL)
VALUES ('POLE-204', 'Oak Street support pole', 'POLE', 'East district · Oak Street', 'Wood distribution pole')
/

INSERT INTO ASSET (ASSET_ID, ASSET_NAME, ASSET_TYPE, LOCATION, MODEL)
VALUES ('CB-07', 'North feeder breaker', 'CIRCUIT_BREAKER', 'North Substation · Feeder 4', 'Vacuum circuit breaker')
/

INSERT INTO ASSET (ASSET_ID, ASSET_NAME, ASSET_TYPE, LOCATION, MODEL)
VALUES ('CB-12', 'East feeder breaker', 'CIRCUIT_BREAKER', 'East Substation · Feeder 2', 'Vacuum circuit breaker')
/

INSERT INTO ASSET (ASSET_ID, ASSET_NAME, ASSET_TYPE, LOCATION, MODEL)
VALUES ('SS-02', 'East Substation', 'SUBSTATION', 'East district', 'Distribution substation')
/

INSERT INTO ASSET (ASSET_ID, ASSET_NAME, ASSET_TYPE, LOCATION, MODEL)
VALUES ('SS-01', 'North Substation', 'SUBSTATION', 'North district', 'Distribution substation')
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2001', 'TX-104', 'Afternoon temperature alarms on north transformer', 'RESOLVED',
    DATE '2026-01-08', DATE '2026-01-09',
    'Dispatch saw three temperature alarms as the afternoon load climbed. Cabinet sounded quieter than usual.',
    'One cooling fan was stationary; debris also covered the intake screen.',
    'Changed the failed fan and cleaned the intake. Checked fan operation before handback.',
    'Next peak period passed without another high-temperature alarm.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2002', 'TX-104', 'Cracks around north bushing skirt', 'RESOLVED',
    DATE '2026-02-03', DATE '2026-02-05',
    'Found fine cracks on the upper bushing during the morning walkdown. No oil visible nearby.',
    'External insulation had weathered around the skirt; the adjacent bushing looked intact.',
    'Replaced the affected bushing in the scheduled outage and recorded acceptance results.',
    'Unit released to operations after satisfactory post-work checks.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2003', 'TX-104', 'Fresh oil under gasket joint', 'RESOLVED',
    DATE '2026-03-01', DATE '2026-03-04',
    'Small fresh oil patch beneath the north unit. The same area was dry on last week''s patrol.',
    'Cleaned the area for inspection and traced seepage to the cover gasket.',
    'Renewed the gasket, cleaned the enclosure and marked the joint for reinspection.',
    'Joint remained dry at the return visit.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2004', 'TX-104', 'Temperature reading jumps with steady load', 'RESOLVED',
    DATE '2026-03-27', DATE '2026-03-31',
    'Control room reports the temperature value jumping up and down although feeder demand barely changes.',
    'Sensor connector had an intermittent contact. Local indication did not follow the remote spikes.',
    'Repaired the connector and compared local and remote readings through a monitoring period.',
    'Readings now track together; no further spikes were logged.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2005', 'TX-104', 'Rattle from transformer enclosure', 'RESOLVED',
    DATE '2026-04-22', DATE '2026-04-27',
    'Evening shift heard a metallic rattle beside TX-104. More noticeable when the cooling equipment starts.',
    'Loose enclosure fasteners allowed a panel to vibrate. No internal source was identified during assessment.',
    'Secured the panel hardware and repeated the operational observation.',
    'Rattle was absent on the follow-up round.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2006', 'TX-104', 'North unit cooling fan cuts out after warming', 'RESOLVED',
    DATE '2026-05-18', DATE '2026-05-19',
    'High temperature returned under heavy demand. This time the fan ran initially, then stopped during the visit.',
    'Fan motor operation became intermittent as it warmed; the intake was clear.',
    'Replaced the intermittent motor assembly and observed a full cooling cycle.',
    'Cooling stayed available through the next afternoon load increase.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2007', 'TX-104', 'Chipped insulation found on second north bushing', 'IN_PROGRESS',
    DATE '2026-06-13', NULL,
    'Patrol photographed a chipped skirt on another bushing after rough weather. Request assessment before the next outage.',
    'Inspection confirmed external insulation damage at the reported location.',
    'Replacement bushing allocated. Installation is awaiting the approved outage slot.',
    'Assessment complete; replacement and acceptance checks still outstanding.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2008', 'TX-104', 'Slow seep at north inspection cover', 'IN_PROGRESS',
    DATE '2026-07-09', NULL,
    'There is a thin oil trail below the inspection cover, separate from the joint repaired earlier this year.',
    'Inspection located a hardened cover seal with a damp lower edge.',
    'Prepared the seal replacement work pack and requested an outage window.',
    'Seepage repair remains in progress; the cover has not yet been resealed.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2009', 'TX-104', 'Remote temperature briefly drops out', 'OPEN',
    DATE '2026-08-04', NULL,
    'Night shift noted short gaps in the north transformer temperature trend. The value returns without operator action.',
    'Trend screenshots attached; sensor and wiring checks have not yet been carried out.',
    'Requested an instrumentation visit to compare the signal at the sensor and panel.',
    'Request is open with no confirmed fault location.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2010', 'TX-104', 'New hum near north cooling cabinet', 'OPEN',
    DATE '2026-08-30', NULL,
    'Operator says the cabinet has developed a louder hum over the last two rounds. No temperature alarm accompanied it.',
    'Only the operator report is available so far; the source has not been inspected.',
    'Raised a noise and vibration inspection for the maintenance crew.',
    'Awaiting assessment; no corrective work recorded.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2011', 'TX-207', 'East transformer running hot at evening peak', 'RESOLVED',
    DATE '2026-01-09', DATE '2026-01-11',
    'TX-207 temperature stayed elevated after the evening demand increase. Air movement at one vent felt weak during the inspection.',
    'Cooling fan had failed and the vent mesh was partly obstructed.',
    'Installed a replacement fan, cleared the mesh and checked the cooling controls.',
    'Temperature settled back into its normal operating range on monitoring.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2012', 'TX-207', 'Weathered east transformer bushing', 'RESOLVED',
    DATE '2026-02-04', DATE '2026-02-07',
    'During the outage walkdown we noticed crazing on a bushing surface. Photos added to the job.',
    'Assessment found deterioration of the external insulation rather than surface dirt.',
    'Changed the bushing and completed the required return-to-service checks.',
    'Acceptance results were satisfactory and operations took the unit back.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2013', 'TX-207', 'Oil streak along east tank seam', 'RESOLVED',
    DATE '2026-03-02', DATE '2026-03-06',
    'An oil streak appeared below the cover seam on the east transformer. No broad puddle was present.',
    'Leak tracing identified a degraded gasket at the seam.',
    'Replaced the gasket during the work window and cleaned away old staining.',
    'Follow-up inspection found no fresh oil at the repaired seam.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2014', 'TX-207', 'East temperature alarm does not match local gauge', 'RESOLVED',
    DATE '2026-03-28', DATE '2026-04-02',
    'Remote high-temperature alarm came in twice with an ordinary local reading. Load was stable both times.',
    'A loose sensor termination produced an intermittent signal.',
    'Corrected the termination and checked the indication against the local instrument.',
    'Remote readings remained stable after the connection repair.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2015', 'TX-207', 'East enclosure buzz during fan operation', 'RESOLVED',
    DATE '2026-04-23', DATE '2026-04-24',
    'Crew reported a buzzing panel on the east unit when the fans were on. Sound stopped as cooling cycled off.',
    'Panel mounting hardware had loosened, allowing contact with the frame.',
    'Secured the mounting points and checked the enclosure with cooling running.',
    'Panel no longer buzzed during the witnessed operating cycle.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2016', 'TX-207', 'Restricted cooling on east transformer', 'RESOLVED',
    DATE '2026-05-19', DATE '2026-05-21',
    'The east unit warmed unusually quickly during a busy afternoon. Fans could be heard but airflow was uneven.',
    'A fan assembly was underperforming and accumulated debris restricted the cooling path.',
    'Replaced the faulty assembly and removed the obstruction from the cooling section.',
    'Subsequent load monitoring showed the expected temperature response.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2017', 'TX-207', 'East bushing damage needs replacement', 'IN_PROGRESS',
    DATE '2026-06-14', NULL,
    'A new surface defect was photographed on the east-side bushing after a weather inspection.',
    'Detailed inspection confirmed a damaged insulation skirt; a replacement is required.',
    'Materials have been reserved and the outage request is with scheduling.',
    'Work is planned but the damaged bushing has not been changed.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2018', 'TX-207', 'Oil dampness at east access plate', 'IN_PROGRESS',
    DATE '2026-07-10', NULL,
    'Found a damp oil line along the access plate. It is not at the previously repaired seam.',
    'The access-plate gasket has deteriorated along its lower edge.',
    'Crew prepared the replacement gasket and isolation work package.',
    'Access-plate repair is awaiting the maintenance window.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2019', 'TX-207', 'East temperature signal flickers on trend', 'OPEN',
    DATE '2026-08-05', NULL,
    'Several isolated temperature spikes appeared in the historian overnight. Operator did not observe a matching load change.',
    'No site measurements yet; the report includes timestamps for the signal check.',
    'Assigned initial inspection of the sensor circuit and event history.',
    'Investigation is pending and the cause remains unconfirmed.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2020', 'TX-207', 'Intermittent vibration reported at TX-207', 'OPEN',
    DATE '2026-08-31', NULL,
    'A low vibration was noticed at the enclosure during the latest patrol. Operator could not reproduce it continuously.',
    'Field assessment is still needed to distinguish panel movement from equipment vibration.',
    'Requested an observation visit during the next cooling cycle.',
    'Open for diagnosis; no hardware has been adjusted.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2021', 'LINE-12', 'Riverside feeder outage after windstorm', 'RESOLVED',
    DATE '2026-01-10', DATE '2026-01-13',
    'Multiple customers lost supply following strong winds along the river corridor.',
    'Line patrol located damaged support hardware on the affected section.',
    'Replaced the damaged fittings during the restoration work and completed release checks.',
    'Supply restored; the subsequent patrol reported no remaining defect at that location.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2022', 'LINE-12', 'Riverside faults only during rainfall', 'RESOLVED',
    DATE '2026-02-05', DATE '2026-02-09',
    'Feeder disturbances seem to coincide with rain. Nothing obvious was reported during dry patrols.',
    'Close inspection found a cracked insulator with weather-related deterioration.',
    'Changed the insulator during an approved outage and documented the inspection.',
    'No repeat rain-related fault appeared in the follow-up period.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2023', 'LINE-12', 'Branches brushing Riverside line', 'RESOLVED',
    DATE '2026-03-03', DATE '2026-03-08',
    'Customers reported brief interruptions on breezy evenings. Patrol noted growth close to the line route.',
    'Several branches were contacting the overhead line corridor.',
    'Authorized vegetation crew removed the interfering growth and recorded clearance work.',
    'The circuit remained steady during subsequent monitoring.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2024', 'LINE-12', 'Hot connector on Riverside span', 'RESOLVED',
    DATE '2026-03-29', DATE '2026-03-30',
    'Thermal patrol flagged one connector warmer than comparable connections on the route.',
    'Assessment found a deteriorated connector at the flagged point.',
    'Replaced that connector during the scheduled outage and completed connection checks.',
    'Return thermal inspection found temperatures comparable with adjacent connections.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2025', 'LINE-12', 'Riverside support bracket out of position', 'RESOLVED',
    DATE '2026-04-24', DATE '2026-04-26',
    'The support hardware at one span looked displaced during patrol. Added location photos to the request.',
    'Inspection confirmed wear in the attachment bracket.',
    'Replaced the worn bracket and checked the support assembly before release.',
    'Assembly accepted with no further movement noted at follow-up.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2026', 'LINE-12', 'Second storm outage near river bend', 'RESOLVED',
    DATE '2026-05-20', DATE '2026-05-23',
    'A later storm interrupted another part of the Riverside circuit. Dispatch linked the reports to the river bend section.',
    'Restoration patrol found a damaged fitting at a different support point from the earlier job.',
    'Renewed the failed fitting and completed the restoration inspection.',
    'Affected customers were restored and the repaired section passed follow-up patrol.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2027', 'LINE-12', 'Rain-associated faults at another Riverside span', 'IN_PROGRESS',
    DATE '2026-06-15', NULL,
    'New wet-weather interruptions reported further along the corridor than the previous insulator repair.',
    'Inspection found cracking on an insulator at the newly reported span.',
    'Replacement part is available; outage coordination is under way.',
    'Fault assessment is complete, with installation still to be scheduled.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2028', 'LINE-12', 'Regrowth approaching Riverside conductors', 'IN_PROGRESS',
    DATE '2026-07-11', NULL,
    'Patrol has flagged new branches near the line beyond the section cleared in March.',
    'Vegetation assessment confirmed encroachment at the new location.',
    'Assigned the clearance work to the approved vegetation contractor.',
    'Clearance work remains outstanding at this span.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2029', 'LINE-12', 'Thermal anomaly on another Riverside connector', 'OPEN',
    DATE '2026-08-06', NULL,
    'Latest thermal route shows a warm connector near the downstream end of LINE-12.',
    'Image and location logged; connection condition has not yet been checked on site.',
    'Requested maintenance review of the thermal finding.',
    'Open thermal defect awaiting confirmation and repair planning.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2030', 'LINE-12', 'Loose-looking hardware on river crossing approach', 'OPEN',
    DATE '2026-09-01', NULL,
    'Patrol photo shows an attachment sitting at an unusual angle near the crossing approach.',
    'No close inspection yet, so bracket wear has not been confirmed.',
    'Raised a support-hardware inspection with the photo reference.',
    'Condition assessment is pending; no parts replaced.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2031', 'LINE-28', 'Industrial park supply lost after storm', 'RESOLVED',
    DATE '2026-01-11', DATE '2026-01-15',
    'Several premises reported loss of supply after the storm passed through the park.',
    'Patrol found storm-damaged hardware on the distribution line.',
    'Replaced the damaged assembly under the restoration plan and checked the affected section.',
    'Service returned and no further outage was logged during observation.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2032', 'LINE-28', 'Industrial line trips in wet conditions', 'RESOLVED',
    DATE '2026-02-06', DATE '2026-02-11',
    'Operations noted brief faults during showers on the industrial circuit.',
    'Inspection identified a split insulator surface on the reported section.',
    'Renewed the damaged insulator in the agreed outage window.',
    'Follow-up monitoring through rainfall showed no repeat fault at that section.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2033', 'LINE-28', 'Tree contact near industrial access road', 'RESOLVED',
    DATE '2026-03-04', DATE '2026-03-05',
    'Short interruptions reported when branches move across the line corridor near the access road.',
    'Vegetation patrol confirmed branch contact at the flagged location.',
    'Approved crew cleared the branches and checked the remaining growth along that span.',
    'Interruption reports stopped during the post-work monitoring period.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2034', 'LINE-28', 'Warm joint on industrial park line', 'RESOLVED',
    DATE '2026-03-30', DATE '2026-04-01',
    'Thermal inspection found a localized hot spot at a line joint under load.',
    'The connector was deteriorated compared with the neighboring joints.',
    'Replaced the connector during an outage and documented the completed checks.',
    'The repaired joint showed no abnormal heating on the next survey.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2035', 'LINE-28', 'Worn line attachment at industrial corner', 'RESOLVED',
    DATE '2026-04-25', DATE '2026-04-28',
    'A bracket near the corner support appeared worn and offset during routine patrol.',
    'Close inspection found wear at the support attachment.',
    'Changed the bracket and inspected the surrounding hardware.',
    'Support position remained correct after the repair inspection.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2036', 'LINE-28', 'Wind damage on eastern industrial span', 'RESOLVED',
    DATE '2026-05-21', DATE '2026-05-25',
    'A second storm caused an outage on the east end of the industrial line, away from the January repair.',
    'Patrol traced the damage to another line-support fitting.',
    'Replaced the affected fitting and finished the required restoration checks.',
    'The eastern section returned to normal service.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2037', 'LINE-28', 'New cracked insulator on industrial route', 'IN_PROGRESS',
    DATE '2026-06-16', NULL,
    'Wet-weather disturbance reported on a span not covered by the earlier insulator replacement.',
    'Inspection confirmed a crack in the insulator at this new location.',
    'Replacement has been picked from stores; the work window is being coordinated.',
    'Repair preparation is underway, but the insulator remains to be changed.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2038', 'LINE-28', 'Vegetation encroachment behind industrial lots', 'IN_PROGRESS',
    DATE '2026-07-12', NULL,
    'Patrol found growth approaching the line behind the rear lots. Customer reports mention brief flickers in wind.',
    'Vegetation survey confirmed encroachment along the identified span.',
    'Contractor visit requested and access arrangements are being finalized.',
    'The clearance job is active and awaiting field completion.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2039', 'LINE-28', 'Possible hot connector at park entrance', 'OPEN',
    DATE '2026-08-07', NULL,
    'Thermal photo at the park entrance shows one connection warmer than its neighbors.',
    'The image needs field confirmation; no connector assessment has been completed.',
    'Submitted the location and image for the next maintenance inspection.',
    'Open inspection request; the heating source is not yet established.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2040', 'LINE-28', 'Shifted support hardware on LINE-28', 'OPEN',
    DATE '2026-09-02', NULL,
    'Support hardware appears shifted in the latest patrol photographs near the end of the route.',
    'Crew has not yet inspected the attachment at close range.',
    'Requested a structural hardware assessment and location verification.',
    'Awaiting inspection before a repair scope is selected.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2041', 'POLE-118', 'Riverside pole leaning after heavy rain', 'RESOLVED',
    DATE '2026-01-12', DATE '2026-01-17',
    'Patrol found POLE-118 leaning after the bank became saturated. Lean was visible compared with the earlier route photo.',
    'Assessment identified erosion around the pole base.',
    'Replaced the affected pole and remediated the surrounding ground under the approved plan.',
    'Replacement and ground works passed acceptance inspection.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2042', 'POLE-118', 'Vehicle strike at Riverside support', 'RESOLVED',
    DATE '2026-02-07', DATE '2026-02-08',
    'A vehicle collision left visible damage on the support pole. Incident location confirmed by dispatch.',
    'Engineering inspection confirmed structural damage from the impact.',
    'Replaced the damaged support and restored its attached equipment.',
    'Replacement structure was accepted and the incident work closed.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2043', 'POLE-118', 'Split crossarm on Riverside pole', 'RESOLVED',
    DATE '2026-03-05', DATE '2026-03-07',
    'Morning patrol picked up a split in the wooden crossarm. Photo shows the defect near an attachment point.',
    'Inspection confirmed deterioration of the crossarm material.',
    'Replaced the crossarm during the planned outage and checked its fittings.',
    'New assembly passed the recorded post-work inspection.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2044', 'POLE-118', 'Movement at Riverside attachment bracket', 'RESOLVED',
    DATE '2026-03-31', DATE '2026-04-03',
    'Crew noticed movement in one attachment during a routine pole inspection.',
    'Fasteners at the bracket were worn; the bracket required refitting.',
    'Replaced the worn fasteners and completed inspection of the attachment.',
    'Attachment was secure at handback with no repeat movement observed.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2045', 'POLE-118', 'Deterioration at Riverside pole ground line', 'RESOLVED',
    DATE '2026-04-26', DATE '2026-04-30',
    'Ground-level inspection flagged loss of material around the base of the support.',
    'Detailed assessment confirmed deterioration requiring replacement.',
    'Replaced the pole using the approved maintenance work plan.',
    'New support passed inspection and was returned to service.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2046', 'POLE-118', 'Renewed erosion around Riverside support', 'RESOLVED',
    DATE '2026-05-22', DATE '2026-05-27',
    'Heavy rain washed material away around the replacement support. Patrol reported a new lean relative to the last inspection.',
    'Site assessment found additional ground erosion affecting the support position.',
    'Replaced the affected support and completed the revised ground remediation work.',
    'Acceptance inspection recorded a stable replacement position.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2047', 'POLE-118', 'New impact damage at Riverside pole', 'IN_PROGRESS',
    DATE '2026-06-17', NULL,
    'Dispatch received another vehicle-impact report at this support location. Fresh damage is visible in the attached photos.',
    'Engineering assessment confirmed that replacement is needed.',
    'Replacement support is allocated and field work is being coordinated.',
    'The replacement job is in progress; final inspection has not occurred.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2048', 'POLE-118', 'Crossarm weathering on current Riverside support', 'IN_PROGRESS',
    DATE '2026-07-13', NULL,
    'Inspection of the current assembly found cracking on a crossarm face.',
    'Assessment confirmed material deterioration at the photographed defect.',
    'Crossarm replacement added to the outage package; components are ready.',
    'Awaiting installation and acceptance of the replacement crossarm.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2049', 'POLE-118', 'Riverside bracket appears to move in wind', 'OPEN',
    DATE '2026-08-08', NULL,
    'Patrol reported movement near an attachment during a windy round. No close-up inspection was possible during that visit.',
    'Movement is reported but the condition of the fasteners is not yet known.',
    'Requested a targeted attachment inspection with the patrol photo.',
    'Open for inspection; no cause or repair has been recorded.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2050', 'POLE-118', 'Possible decay at Riverside pole base', 'OPEN',
    DATE '2026-09-03', NULL,
    'Routine patrol flagged a suspect area near the ground line of the current support.',
    'Detailed condition assessment has not yet been completed.',
    'Assigned a pole-base assessment to establish the extent of deterioration.',
    'Replacement need remains undetermined pending the assessment.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2051', 'POLE-204', 'Oak Street pole tilt after runoff', 'RESOLVED',
    DATE '2026-01-13', DATE '2026-01-14',
    'Runoff left a visible depression beside POLE-204 and the pole no longer looked vertical.',
    'Inspection found ground erosion affecting the base support.',
    'Replaced the affected pole and restored the surrounding ground area.',
    'The new support met acceptance checks after the ground work.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2052', 'POLE-204', 'Collision damage at Oak Street support', 'RESOLVED',
    DATE '2026-02-08', DATE '2026-02-10',
    'Road incident reported at the Oak Street pole. Crew found fresh impact marks and damaged wood.',
    'Structural assessment determined the pole required replacement.',
    'Changed the damaged pole and reinstated the supported equipment.',
    'Support replacement accepted and the collision job completed.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2053', 'POLE-204', 'Oak Street crossarm cracking', 'RESOLVED',
    DATE '2026-03-06', DATE '2026-03-09',
    'A longitudinal crack was photographed in the wooden crossarm during patrol.',
    'Inspection confirmed weathered material at the crack.',
    'Installed a replacement crossarm during the maintenance outage.',
    'Post-work check found the crossarm assembly serviceable.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2054', 'POLE-204', 'Loose attachment on Oak Street pole', 'RESOLVED',
    DATE '2026-04-01', DATE '2026-04-05',
    'An attachment bracket rattled during the inspection round. Movement was localized to the mounting hardware.',
    'Worn fasteners were identified at the bracket mounting.',
    'Renewed the fasteners and inspected the refitted attachment.',
    'No movement remained at the completed inspection.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2055', 'POLE-204', 'Ground-line damage on Oak Street pole', 'RESOLVED',
    DATE '2026-04-27', DATE '2026-05-02',
    'Inspector noted deterioration near the base and requested a detailed assessment.',
    'Assessment confirmed material loss that warranted replacing the support.',
    'Replaced the pole during the authorized maintenance work.',
    'Acceptance checks completed and the replacement entered service.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2056', 'POLE-204', 'Oak Street support affected by later washout', 'RESOLVED',
    DATE '2026-05-23', DATE '2026-05-24',
    'A later downpour washed out ground beside the replacement pole. Patrol recorded renewed leaning.',
    'Assessment linked the changed position to fresh erosion around the base.',
    'Replaced the affected support and completed additional ground remediation.',
    'Follow-up inspection accepted the support position and surrounding ground.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2057', 'POLE-204', 'Second collision at Oak Street location', 'IN_PROGRESS',
    DATE '2026-06-18', NULL,
    'Another road collision damaged the current pole. Dispatch attached the incident reference to this job.',
    'Inspection confirmed new structural damage rather than the earlier repaired condition.',
    'Replacement work is being arranged with the field crew and traffic coordination.',
    'Job remains active pending replacement and final acceptance.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2058', 'POLE-204', 'Oak Street crossarm defect during follow-up', 'IN_PROGRESS',
    DATE '2026-07-14', NULL,
    'Follow-up inspection identified a split on the current wooden crossarm.',
    'The defect was assessed as weather-related material deterioration.',
    'Prepared the replacement assembly and requested an outage slot.',
    'Crossarm work is planned; field replacement has not been completed.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2059', 'POLE-204', 'Attachment movement reported on Oak Street', 'OPEN',
    DATE '2026-08-09', NULL,
    'The patrol crew reported a moving attachment near the upper bracket. Photographs do not clearly show the fasteners.',
    'A close inspection is still required to identify the loose component.',
    'Scheduled an attachment assessment for the maintenance team.',
    'Open request awaiting a confirmed defect and repair scope.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2060', 'POLE-204', 'Suspect ground-line condition at Oak Street', 'OPEN',
    DATE '2026-09-04', NULL,
    'A new inspection note flags soft-looking material around part of the pole base.',
    'The extent of deterioration has not been established by assessment.',
    'Requested a detailed condition check of the current support.',
    'No replacement decision yet; the inspection is pending.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2061', 'CB-07', 'North breaker trips without sustained fault', 'RESOLVED',
    DATE '2026-01-14', DATE '2026-01-16',
    'CB-07 tripped repeatedly, but the feeder records did not show a sustained fault.',
    'Testing found an intermittent connection in the control circuit.',
    'Repaired the control connection and completed functional checks.',
    'No repeat trip occurred during the subsequent monitoring period.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2062', 'CB-07', 'North breaker counter disagrees with log', 'RESOLVED',
    DATE '2026-02-09', DATE '2026-02-12',
    'Local operation count was behind the event log during the maintenance review.',
    'Testing confirmed the operation counter was not registering consistently.',
    'Changed the counter and reconciled the baseline with the event record.',
    'Counter tracked the subsequent operations correctly.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2063', 'CB-07', 'North breaker remote status slow to update', 'RESOLVED',
    DATE '2026-03-07', DATE '2026-03-11',
    'Control room indication lagged behind the observed local breaker operation.',
    'A worn auxiliary contact caused delayed status feedback.',
    'Replaced the auxiliary contact and checked local-to-remote indication.',
    'Status updates agreed with local operation during verification.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2064', 'CB-07', 'Mechanism alarm during north breaker check', 'RESOLVED',
    DATE '2026-04-02', DATE '2026-04-07',
    'Routine check produced a mechanism alarm on CB-07.',
    'Inspection identified a worn component in the operating mechanism.',
    'Replaced the component and carried out acceptance testing.',
    'Mechanism completed the required operating checks without the alarm.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2065', 'CB-07', 'Hot terminal on north breaker', 'RESOLVED',
    DATE '2026-04-28', DATE '2026-04-29',
    'Thermal survey showed one breaker terminal warmer than comparable terminals under load.',
    'Connection assessment identified deterioration at that terminal.',
    'Repaired the connection during the planned outage and recorded the checks.',
    'Follow-up thermal survey showed normal terminal temperatures.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2066', 'CB-07', 'North breaker nuisance trips return', 'RESOLVED',
    DATE '2026-05-24', DATE '2026-05-26',
    'New intermittent trips were logged after months without an event. Fault records again showed no sustained feeder fault.',
    'Testing isolated a separate intermittent control-circuit termination.',
    'Repaired that termination and repeated the functional sequence.',
    'Monitoring after this repair showed no further nuisance trips.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2067', 'CB-07', 'North counter misses another operation', 'IN_PROGRESS',
    DATE '2026-06-19', NULL,
    'Event review found a new mismatch between the local counter and logged breaker operations.',
    'Checks confirmed the current counter was intermittently failing to advance.',
    'Replacement counter obtained; installation is included in the next work window.',
    'Counter repair is in progress and reconciliation is still outstanding.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2068', 'CB-07', 'North status feedback intermittently delayed', 'IN_PROGRESS',
    DATE '2026-07-15', NULL,
    'Operators reported a fresh delay between local operation and remote indication.',
    'Testing identified deterioration in an auxiliary contact on the feedback circuit.',
    'Prepared the contact replacement and coordinated an outage with operations.',
    'Feedback repair remains open within the active maintenance job.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2069', 'CB-07', 'Unexplained north mechanism warning', 'OPEN',
    DATE '2026-08-10', NULL,
    'A mechanism warning appeared on the latest routine check and then cleared.',
    'The event has been recorded, but no mechanism inspection has been completed.',
    'Requested diagnostic checks with the alarm timestamp.',
    'Request awaits diagnosis; no component fault is confirmed.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2070', 'CB-07', 'New hot spot on north breaker connection', 'OPEN',
    DATE '2026-09-05', NULL,
    'Latest thermal route flagged another terminal connection on CB-07.',
    'Thermal image logged; an electrical connection assessment is still required.',
    'Raised a maintenance inspection for the newly flagged terminal.',
    'Open thermal finding awaiting investigation.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2071', 'CB-12', 'East breaker repeats unexpected trips', 'RESOLVED',
    DATE '2026-01-15', DATE '2026-01-18',
    'East feeder breaker opened several times without evidence of a sustained feeder fault.',
    'Control-circuit testing found an intermittent connection at a termination.',
    'Repaired the termination and completed the functional test sequence.',
    'No repeat unexpected opening was recorded after the repair.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2072', 'CB-12', 'East operation counter falls behind', 'RESOLVED',
    DATE '2026-02-10', DATE '2026-02-14',
    'Maintenance review found the breaker counter reading lower than the recorded operation total.',
    'The counter failed to advance consistently during checks.',
    'Replaced the faulty counter and established a reconciled starting count.',
    'Subsequent operation counts matched the event log.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2073', 'CB-12', 'East remote position indication lags', 'RESOLVED',
    DATE '2026-03-08', DATE '2026-03-13',
    'Remote breaker position remained unchanged briefly after local operation.',
    'Inspection and testing identified a worn auxiliary feedback contact.',
    'Renewed the contact and verified the indication path.',
    'Control room indication followed the local operation correctly on test.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2074', 'CB-12', 'East operating mechanism alarm', 'RESOLVED',
    DATE '2026-04-03', DATE '2026-04-04',
    'Mechanism alarm was present during the scheduled inspection of CB-12.',
    'Assessment identified wear in an operating-mechanism component.',
    'Changed the worn part and completed the required operating checks.',
    'Acceptance test completed without a repeat mechanism alarm.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2075', 'CB-12', 'East breaker terminal heating', 'RESOLVED',
    DATE '2026-04-29', DATE '2026-05-01',
    'Thermal inspection picked up elevated temperature at an east breaker terminal.',
    'Deterioration was found at the affected connection.',
    'Restored the connection during the approved outage and checked the completed work.',
    'Return thermal inspection found the terminal within its normal range.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2076', 'CB-12', 'Further intermittent trips at east breaker', 'RESOLVED',
    DATE '2026-05-25', DATE '2026-05-28',
    'Operations logged a new cluster of trips after a quiet period. No sustained fault appeared in feeder records.',
    'An intermittent connection was found at another point in the control wiring.',
    'Repaired the identified connection and ran the functional checks again.',
    'The breaker remained stable through the follow-up monitoring period.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2077', 'CB-12', 'East counter mismatch on later review', 'IN_PROGRESS',
    DATE '2026-06-20', NULL,
    'A later maintenance reconciliation found that the current counter was missing operations.',
    'Testing confirmed intermittent counter failure on the installed device.',
    'A replacement has been arranged and installation is awaiting the work slot.',
    'Counter replacement and final log reconciliation are still pending.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2078', 'CB-12', 'East status feedback delay returns', 'IN_PROGRESS',
    DATE '2026-07-16', NULL,
    'A new delay in remote position feedback was reported during an operating sequence.',
    'Tests traced the delay to a deteriorated auxiliary contact.',
    'Replacement contact is ready; field work is being coordinated with operations.',
    'The feedback defect has been assessed but not yet repaired.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2079', 'CB-12', 'East breaker mechanism alert needs review', 'OPEN',
    DATE '2026-08-11', NULL,
    'Operator logged a brief operating-mechanism alert during the latest check.',
    'No inspection results yet; the alert record is attached for diagnosis.',
    'Assigned the mechanism assessment to the maintenance team.',
    'Investigation remains open with no confirmed failed part.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2080', 'CB-12', 'Warm terminal reported on east breaker', 'OPEN',
    DATE '2026-09-06', NULL,
    'Thermal patrol flagged a terminal connection on CB-12 as hotter than nearby connections.',
    'The patrol image is available; the cause of heating has not been assessed.',
    'Requested field investigation of the flagged connection.',
    'Repair has not started; this thermal finding is awaiting assessment.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2081', 'SS-02', 'East auxiliary supply loss triggers alarms', 'RESOLVED',
    DATE '2026-01-16', DATE '2026-01-20',
    'Several monitoring alarms arrived together when the auxiliary supply dropped.',
    'Inspection found a failed auxiliary power component.',
    'Replaced the failed component and checked the affected monitoring equipment.',
    'Auxiliary supply and monitoring availability were restored.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2082', 'SS-02', 'East telemetry offline with local plant running', 'RESOLVED',
    DATE '2026-02-11', DATE '2026-02-16',
    'Remote values stopped updating although staff reported that local equipment was still operating.',
    'Testing found a failed power supply serving the communications equipment.',
    'Replaced the communications supply and verified telemetry updates.',
    'Remote status and measurement updates resumed.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2083', 'SS-02', 'East equipment room too warm', 'RESOLVED',
    DATE '2026-03-09', DATE '2026-03-10',
    'Room temperature alarm came in during high demand. Cooling did not appear to respond normally.',
    'Inspection identified a fault in the room cooling unit.',
    'Repaired the cooling unit and observed the room temperature trend.',
    'Room temperature returned to the expected operating range.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2084', 'SS-02', 'Rainwater inside east control building', 'RESOLVED',
    DATE '2026-04-04', DATE '2026-04-06',
    'Water was found near the control-building entry after heavy rain.',
    'Inspection traced the ingress to a damaged weather seal.',
    'Repaired the seal and inspected the affected interior area.',
    'Next follow-up inspection found no fresh water ingress.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2085', 'SS-02', 'East telemetry drops intermittently', 'RESOLVED',
    DATE '2026-04-30', DATE '2026-05-03',
    'Operators report telemetry disappearing briefly and then returning several times per shift.',
    'Diagnostics isolated an intermittent fault in the communications module.',
    'Replaced the module and verified the communications path.',
    'No additional telemetry interruption was observed during monitoring.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2086', 'SS-02', 'Another east auxiliary power interruption', 'RESOLVED',
    DATE '2026-05-26', DATE '2026-05-30',
    'A later auxiliary supply interruption raised multiple alarms, on a different supply component from the earlier failure.',
    'Inspection located the failed component in the auxiliary supply circuit.',
    'Changed that component and checked monitoring-system recovery.',
    'Supply remained available throughout the post-repair observation.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2087', 'SS-02', 'East remote updates stop again', 'IN_PROGRESS',
    DATE '2026-06-21', NULL,
    'Local equipment remained operational but remote updates stopped on the current communications supply.',
    'Testing confirmed failure of the communications power supply now installed.',
    'Replacement supply reserved; installation and verification are being scheduled.',
    'Telemetry repair is active with restoration checks still outstanding.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2088', 'SS-02', 'East room cooling performance reduced', 'IN_PROGRESS',
    DATE '2026-07-17', NULL,
    'The equipment room is warming above its usual trend and cooling response is weak.',
    'Assessment confirmed a fault in the cooling unit.',
    'Cooling repair work is being arranged with the maintenance contractor.',
    'Repair is underway as a job; restored cooling has not been verified.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2089', 'SS-02', 'New water mark in east control building', 'OPEN',
    DATE '2026-08-12', NULL,
    'Patrol noticed a fresh water mark after rainfall, away from the previously repaired entry seal.',
    'Source has not been traced; photographs show the affected area.',
    'Requested a building-envelope inspection to locate the water path.',
    'Open investigation with no confirmed ingress point.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2090', 'SS-02', 'East telemetry gaps need diagnosis', 'OPEN',
    DATE '2026-09-07', NULL,
    'Control room logged several short gaps in remote measurements overnight.',
    'Logs are attached, but no communications component has been tested yet.',
    'Assigned diagnostic review of the communications path and power supply.',
    'Awaiting diagnosis; module failure has not been confirmed.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2091', 'SS-01', 'North auxiliary supply interruption', 'RESOLVED',
    DATE '2026-01-17', DATE '2026-01-22',
    'An auxiliary supply outage at the north site brought in several alarms together.',
    'Inspection identified a failed component feeding the auxiliary circuit.',
    'Renewed the failed component and checked the monitoring systems.',
    'Auxiliary power was restored and the related alarms cleared.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2092', 'SS-01', 'North remote monitoring stops', 'RESOLVED',
    DATE '2026-02-12', DATE '2026-02-13',
    'Local equipment was running, but the control room had no fresh telemetry from SS-01.',
    'Tests identified a failed communications power supply.',
    'Changed the supply and confirmed that remote data updates restarted.',
    'Monitoring availability returned after the supply replacement.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2093', 'SS-01', 'North control room cooling alarm', 'RESOLVED',
    DATE '2026-03-10', DATE '2026-03-12',
    'A high-temperature alarm came from the equipment room during the afternoon peak.',
    'Cooling-unit inspection found a fault preventing normal cooling response.',
    'Repaired the unit and monitored room conditions through recovery.',
    'Temperature returned to the recorded normal range.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2094', 'SS-01', 'Water ingress at north building seal', 'RESOLVED',
    DATE '2026-04-05', DATE '2026-04-08',
    'Rainwater was reported inside the control building following a heavy shower.',
    'Inspection identified a damaged weather seal at the ingress location.',
    'Repaired the weather seal and checked the surrounding area.',
    'No further ingress was found at the follow-up inspection.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2095', 'SS-01', 'North communications repeatedly drop out', 'RESOLVED',
    DATE '2026-05-01', DATE '2026-05-05',
    'Telemetry was lost intermittently while the local systems continued to operate.',
    'Diagnostic checks identified a faulty communications module.',
    'Replaced the module and verified communications continuity.',
    'Remote updates remained stable during follow-up monitoring.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2096', 'SS-01', 'Later auxiliary failure at north site', 'RESOLVED',
    DATE '2026-05-27', DATE '2026-06-01',
    'A separate auxiliary supply component failed later in the year, again producing several monitoring alarms.',
    'Inspection confirmed the new failure was on a different component from the January repair.',
    'Replaced the affected component and verified supply recovery to the monitoring equipment.',
    'The auxiliary circuit remained available after restoration.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2097', 'SS-01', 'North telemetry supply failure under repair', 'IN_PROGRESS',
    DATE '2026-06-22', NULL,
    'Remote monitoring stopped on the current installation while local operation continued.',
    'Testing confirmed failure of the installed communications power supply.',
    'Replacement ordered and the installation work has been assigned.',
    'Remote monitoring repair is in progress; completion checks remain outstanding.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2098', 'SS-01', 'North cooling unit requires further work', 'IN_PROGRESS',
    DATE '2026-07-18', NULL,
    'Room temperature began climbing again during a later warm period.',
    'Assessment identified a new fault within the room cooling unit.',
    'Repair parts are allocated and the contractor work window is being arranged.',
    'Cooling repair has not yet reached the verification stage.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2099', 'SS-01', 'Damp patch after rain at north building', 'OPEN',
    DATE '2026-08-13', NULL,
    'Patrol found a new damp patch inside the building after rainfall. It is away from the earlier seal repair.',
    'The water entry path has not been identified by inspection.',
    'Requested assessment of the building seals and the reported interior location.',
    'Open building defect awaiting investigation.'
)
/

INSERT INTO MAINTENANCE_REQUEST (REQUEST_ID, ASSET_ID, TITLE, STATUS, REPORTED_DATE, RESOLVED_DATE, PROBLEM, FINDINGS, SOLUTION_REMARKS, OUTCOME)
VALUES (
    'WR-2100', 'SS-01', 'Intermittent north telemetry gaps', 'OPEN',
    DATE '2026-09-08', NULL,
    'Operators logged short losses of substation telemetry on several recent rounds.',
    'No root cause confirmed; event times have been collected for diagnostic review.',
    'Requested checks of the communications module, supply and signal path.',
    'Investigation is pending with no repair recorded for this event.'
)
/

COMMIT
/
