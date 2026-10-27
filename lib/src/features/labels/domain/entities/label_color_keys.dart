/// The 16 label palette keys (plan §12.2). Labels store these strings; the
/// theme maps them to tones (`LabelColor` in `app/theme/label_palette.dart`,
/// kept in sync by a test).
const labelColorKeys = <String>[
  'gray', 'brown', 'red', 'rose', 'orange', 'amber', 'yellow', 'lime', //
  'green', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'pink',
];

/// Order for auto-assigning colors to new labels (LBL-01): well-separated
/// hues first, so the first few labels are easy to tell apart.
const labelColorAutoOrder = <String>[
  'teal', 'indigo', 'amber', 'rose', 'green', 'sky', 'violet', 'orange', //
  'cyan', 'pink', 'lime', 'blue', 'brown', 'red', 'yellow', 'gray',
];
