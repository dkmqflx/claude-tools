# Model Layer Conventions

Covers `model/dto.ts`.

## Rules

- Use `type` keyword — never `interface`
- Suffix naming: `RequestDto`, `ResponseDto`
- TSDoc comments for every field
- All DTO types imported by `api/` files must come from this file

## Example

```typescript
/**
 * Request DTO for updating user profile.
 */
export type UpdateUserProfileRequestDto = {
  /** Display name shown in the UI */
  displayName: string;
  /** ISO 8601 date string */
  updatedAt: string;
};

/**
 * Response DTO returned after updating user profile.
 */
export type UpdateUserProfileResponseDto = {
  /** Firestore document ID */
  id: string;
  displayName: string;
  updatedAt: string;
};
```
