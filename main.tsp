import "@typespec/http";
import "@typespec/rest";
import "@typespec/json-schema";
import "@typespec/openapi3";
import "./problemdetails.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.JsonSchema;
using Problems;

enum AccountState {
    Active: "active",
    Locked: "locked",
    Disabled: "disabled"
}

model Account {
    @key
    @TypeSpec.JsonSchema.extension("readonly", JsonSchema.Json<true>)
    @visibility("read")
    @format("uuid")
    id: string;
    @maxLength(255)
    name: string;
    @format("date")
    birthdate?: string; // utcDateTime - no date without time (like in JS)
    state: AccountState;
}

model Product {
    @key
    @TypeSpec.JsonSchema.extension("readonly", JsonSchema.Json<true>)
    @visibility("read")
    @format("uuid")
    id: string;
    @maxLength(255)
    name: string;
    @minValue(0)
    price: float;
}

@route("/accounts")
interface AccountService
     extends Resource.ResourceOperations<Account,ProblemDetails> {
}

@route("/products")
interface ProductService
     extends Resource.ResourceOperations<Product,ProblemDetails> {
}

