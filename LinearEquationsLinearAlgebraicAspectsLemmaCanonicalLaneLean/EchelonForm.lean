import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

/-!
# Row Echelon Form Package
-/

structure EchelonFormPackage {V : Type u} [AddCommGroup V] [Module ℝ V] where
  matrix : Matrix (Fin n) (Fin m) ℝ
  isRowEchelon : Prop
  pivotPositions : List (Fin n × Fin m)
  rank : Nat
  rowSpaceBasis : Vect
  pivotPositionsCorrect : pivotPositions.length = rank
  rankAtMostRows : rank ≤ n
  rankAtMostColumns : rank ≤ m

structure EchelonFormEvidence {V : Type u} [AddCommGroup V] [Module ℝ V] (E : EchelonFormPackage V) where
  isRowEchelonClosed : E.isRowEchelon
  pivotPositionsCorrectClosed : E.pivotPositionsCorrect
  rankAtMostRowsClosed : E.rankAtMostRows
  rankAtMostColumnsClosed : E.rankAtMostColumns

def EchelonFormClosed {V : Type u} [AddCommGroup V] [Module ℝ V] (E : EchelonFormPackage V) : Prop :=
  E.isRowEchelon ∧ E.pivotPositionsCorrect ∧ E.rankAtMostRows ∧ E.rankAtMostColumns

theorem echelon_form_closed_from_evidence {V : Type u} [AddCommGroup V] [Module ℝ V]
    (E : EchelonFormPackage V) (Ev : EchelonFormEvidence E) : EchelonFormClosed E :=
  And.intro Ev.isRowEchelonClosed (And.intro Ev.pivotPositionsCorrectClosed (And.intro Ev.rankAtMostRowsClosed Ev.rankAtMostColumnsClosed))

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse