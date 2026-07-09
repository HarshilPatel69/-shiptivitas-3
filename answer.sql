-- TYPE YOUR SQL QUERY BELOW
-- Context: the Kanban Board feature was released on 2018-06-02.
-- All *_timestamp / timestamp columns are stored as unix epoch seconds.

-- =====================================================================
-- PART 1: Daily average users before and after the feature change
-- =====================================================================

-- 1a. Daily Active Users (DAU) time-series.
--     One row per calendar day = distinct users who logged in that day.
--     This is the series used to plot the "daily active users" graph.
SELECT
  DATE(login_timestamp, 'unixepoch') AS day,
  COUNT(DISTINCT user_id)            AS active_users
FROM login_history
GROUP BY day
ORDER BY day;

-- 1b. Average DAU BEFORE vs AFTER the 2018-06-02 release.
--     (Average of the daily active-user counts within each period.)
--     Result on the provided data: before = 3.63, after = 11.79 (a ~3.25x lift).
SELECT
  period,
  ROUND(AVG(active_users), 2) AS avg_daily_active_users
FROM (
  SELECT
    DATE(login_timestamp, 'unixepoch') AS day,
    CASE
      WHEN DATE(login_timestamp, 'unixepoch') < '2018-06-02' THEN 'before'
      ELSE 'after'
    END                                AS period,
    COUNT(DISTINCT user_id)            AS active_users
  FROM login_history
  GROUP BY day
)
GROUP BY period;


-- =====================================================================
-- PART 2: Number of status changes by card
-- =====================================================================

-- A "status change" is a history row where the status actually changed.
-- We exclude the initial creation rows (oldStatus IS NULL) because a card
-- being created is not a change from a previous status.
SELECT
  h.cardID,
  c.name,
  COUNT(*) AS status_changes
FROM card_change_history h
JOIN card c ON c.id = h.cardID
WHERE h.oldStatus IS NOT NULL
  AND h.oldStatus <> h.newStatus
GROUP BY h.cardID, c.name
ORDER BY status_changes DESC;

-- Optional: distribution of cards by number of status changes
-- (how the 200 cards spread across 0..5 changes), useful for a histogram.
SELECT
  status_changes,
  COUNT(*) AS number_of_cards
FROM (
  SELECT
    c.id AS card_id,
    COUNT(CASE WHEN h.oldStatus IS NOT NULL
               AND h.oldStatus <> h.newStatus THEN 1 END) AS status_changes
  FROM card c
  LEFT JOIN card_change_history h ON h.cardID = c.id
  GROUP BY c.id
)
GROUP BY status_changes
ORDER BY status_changes;
