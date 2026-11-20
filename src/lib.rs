/// Suma dos importes en centimos sin desbordar.
pub fn sumar(a: u64, b: u64) -> Option<u64> {
    a.checked_add(b)
}
