// Converts the Gregorian date to Ethiopian date
function convertToEthiopianDate(date) {
  const months = [
    "መስከረም",
    "ጥቅምት",
    "ህዳር",
    "ታኅሳስ",
    "ጥር",
    "የካቲት",
    "መጋቢት",
    "ሚያዝያ",
    "ግንቦት",
    "ሰኔ",
    "ሐምሌ",
    "ነሐሴ",
    "ጳጉሜን",
  ];

  const days = [
    "እሁድ", // Sunday
    "ሰኞ", // Monday
    "ማክሰኞ", // Tuesday
    "እሮብ", // Wednesday
    "ሐሙስ", // Thursday
    "አርብ", // Friday
    "ቅዳሜ", // Saturday
  ];

  // Adjust the date to the Ethiopian calendar
  const gregorianYear = date.getFullYear();
  const gregorianMonth = date.getMonth();
  const gregorianDay = date.getDate();
  const dayOfWeek = date.getDay(); // Get the day of the week (0 for Sunday, 1 for Monday, etc.)

  // Ethiopian calendar offset (simple approximation)
  const ethiopianYear = gregorianYear - 8;
  const ethiopianMonth = (gregorianMonth + 4) % 12;
  const ethiopianDay = gregorianDay;

  // Get the Amharic day name
  const amharicDay = days[dayOfWeek];

  // Return the full date in Amharic format
  return `${amharicDay}፣ ${ethiopianDay} ${months[ethiopianMonth]} ${ethiopianYear}`;
}

// Get the current device date
const date = new Date();
const ethiopianDate = convertToEthiopianDate(date);

// Update the screen text with the Ethiopian date
script.text.text = ethiopianDate;

function convertToEthiopianDayofweek(dayofweek) {
  const days = [
    "እሁድ", // Sunday
    "ሰኞ", // Monday
    "ማክሰኞ", // Tuesday
    "እሮብ", // Wednesday
    "ሐሙስ", // Thursday
    "አርብ", // Friday
    "ቅዳሜ", // Saturday
  ];

  const dayOfWeek = date.getDay();

  const amharicDay = days[dayOfWeek];

  return `${amharicDay}`;
}

const ethiopianDayofweek = convertToEthiopianDayofweek(date);
script.text.text = ethiopianDayofweek;
