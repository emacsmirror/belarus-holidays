;; Belarus holidays whith transfers
(eval-when-compile
  (require 'calendar)
  (require 'holidays))

(defvar holiday-belarus-holidays nil
  "Праздники Беларуси")

(setq holiday-belarus-holidays
  `(
    (holiday-fixed 1 1 "Новый год (нерабочий)")
    (holiday-once 1 2 2018 "Перенос рабочего дня (нерабочий)")
    (holiday-once 1 20 2018 "Перенос рабочего дня (рабочий)")
    (holiday-fixed 2 23 "День защитников Отечества и Вооруженных Сил Республики Беларусь")
    (holiday-once 3 3 2018 "Перенос рабочего дня (рабочий)")
    (holiday-fixed 3 8 "День женщин (нерабочий)")
    (holiday-once 3 9 2018 "Перенос рабочего дня (нерабочий)")
    (holiday-fixed 3 15 "День конституции")
    (holiday-fixed 4 2 "День единения народов Беларуси и России")
    (holiday-once 4 14 2018 "Перенос рабочего дня (рабочий)")
    (holiday-once 4 16 2018 "Перенос рабочего дня (нерабочий)")
    (holiday-once 4 28 2018 "Перенос рабочего дня (рабочий)")
    (holiday-once 4 30 2018 "Перенос рабочего дня (нерабочий)")
    (holiday-fixed 5 1 "Праздник труда (нерабочий)")
    (holiday-fixed 5 9 "День Победы (нерабочий)")
    (holiday-float 5 0 2 "День Государственного герба и Государственного флага Республики Беларусь")
    (holiday-once 7 2 2018 "Перенос рабочего дня (нерабочий)")
    (holiday-fixed 7 3 "День Независимости Республики Беларусь (День Республики) (нерабочий)")
    (holiday-once 7 7 2018 "Перенос рабочего дня (рабочий)")
    (holiday-fixed 11 7 "День Октябрьской революции (нерабочий)")
    (holiday-once 12 22 2018 "Перенос рабочего дня (рабочий)")
    (holiday-once 12 24 2018 "Перенос рабочего дня (нерабочий)")
    (holiday-once 12 29 2018 "Перенос рабочего дня (рабочий)")
    (holiday-once 12 31 2018 "Перенос рабочего дня (нерабочий)")
    (holiday-fixed 1 7 "Рождество Христово (православное) (нерабочий)")
    (holiday-easter-etc 0 "Католическая Пасха (нерабочий)")
    (holiday-eastern-etc 0 "Православная Пасха (нерабочий)")
    (holiday-eastern-etc 9 "Радоница (по календарю православной конфессии на 9-й день после Пасхи) (нерабочий)")
    (holiday-fixed 12 25 "Рождество Христово (католическое) (нерабочий)")
    ))

(defun holiday-eastern-etc (&optional n string)
  "Date of Nth day after Orthodox Easter (named STRING), if visible in calendar window.
Negative values of N are interpreted as days before Easter.
STRING is used purely for display purposes.  The return value has
the form ((MONTH DAY YEAR) STRING), where the date is that of the
Nth day before or after Easter.
URL: https://www.emacswiki.org/emacs/ukrainian-holidays.el"
(list (list
 (if (= n 0)
  (easter-eastern displayed-year)
   (calendar-gregorian-from-absolute
    (+ n (calendar-absolute-from-gregorian
	  (easter-eastern displayed-year)))))
   string)))

(defun easter-eastern (year)
  (let* ((x (% (+ (* (% year 19) 19) 15) 30))
	 (day (- (+ x 10)
		 (% (+ (/ (* year 5) 4) x) 7))))
    (if (< day 31)
	(list 4 day year)
      (list 5 (- day 30) year))))

(defun holiday-once (month day year string)
  "Holiday on MONTH, DAY (Gregorian), YEAR called STRING.
If MONTH, DAY, YEAR is visible, the value returned is the list (((MONTH DAY YEAR)
STRING)). Returns nil if it is not visible in the current calendar window."
  (let ((m displayed-month))
    (calendar-increment-month m year (- 11 month))
    (if (> m 9)
        (list (list (list month day year) string)))))

(provide 'belarus-holidays)
