CREATE TABLE "bookings" (
	"id" serial PRIMARY KEY,
	"code" text NOT NULL UNIQUE,
	"service_id" text NOT NULL,
	"barber_id" text NOT NULL,
	"date" text NOT NULL,
	"time" text NOT NULL,
	"duration_min" integer NOT NULL,
	"customer_name" text NOT NULL,
	"phone" text NOT NULL,
	"email" text,
	"notes" text,
	"status" text DEFAULT 'confirmed' NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE INDEX "bookings_date_idx" ON "bookings" ("date");--> statement-breakpoint
CREATE UNIQUE INDEX "bookings_active_slot_uidx" ON "bookings" ("barber_id","date","time") WHERE "status" = 'confirmed';
