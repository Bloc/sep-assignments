Using proper pseudo-code, describe three or more primitive algorithms used in your day-to-day life. Write your answers in a file called intro_algorithms_answers.txt.

### Tipping
def calculate_tip(establishment_type, have_cash, tax, bill, service_level, in_tipping_country, x_factor)
  RETURN IF in_tipping_country IS FALSE AND service_level IS LESS THAN 5
  IF establishment_type IS BAR
    IF have_cash IS TRUE
      IF bill =< 5
        RETURN 1
      THEN IF bill > 100
        IF service_level >= 5
          IF x_factor TRUE
            RETURN 100_dollar_bill
          ELSE
            RETURN bill * 30% ≈ IN CASH
          END
        THEN IF service_level < 5
          RETURN bill * 20% ≈ IN CASH
        END
      ELSE
        IF service_level > 5
          IF x_factor TRUE
            return bill
          ELSE
            return bill * RANDOM(35..50)%
          END
        THEN IF service_level > 4
          RETURN bill * 25%
        THEN IF service > 0
          return tax * 2
        ELSE
          return tax
        END
      END
    ELSE
      IF service_level > 5
        IF x_factor TRUE
          return bill
        ELSE
          return bill * RANDOM(35..50)%
        END
      THEN IF service_level > 4
        RETURN bill * 25%
      THEN IF service > 0
        return tax * 2
      ELSE
        return tax
      END
    END
  THEN IF establishment_type IS FOOD_ESTABLISHMENT
    IF service_level > 5
      IF x_factor TRUE
        return bill
      ELSE
        return bill * RANDOM(35..50)%
      END
    THEN IF service_level > 4
      RETURN bill * 25%
    THEN IF service > 0
      return tax * 2
    ELSE
      return tax
    END
  END
end
### Choosing What to Wear
```
laundry_cycle = 60

def what_to_wear(time_to_get_ready, clothing_options, **selected_outfit)
  begin
    start_time = DateTime.now
    stash = []
    raise FeelingPressure IF time_to_get_ready <= 0
    raise NoCleanClothes IF clothing_options.empty? && time_to_get_ready < laundry_cycle
    IF selected_outfit.nil?
      selected_outfit = {
        top: null,
        bottom: null,
        underclothes: null,
        socks: null
      }
    else
      selected_outfit = selected_outfit
    END
      selected_outfit = CALL clothing_looper WITH clothing_options AND selected_outfit
    IF selected_outfit KEYS HAS NULL VALUE
      time_left = start_time - time_to_get_ready
      IF time_left < laundry_cycle
        new_clothing_options = raise NoCleanClothes
        CALL what_to_wear WITH time_left AND new_clothing_options AND selected_outfit
      THEN IF laundry_cycle < time_left
        new_clothing_options = raise LaunderDirtyClothes
        CALL what_to_wear WITH time_left AND new_clothing_options AND selected_outfit
    ELSE
      RETURN selected_outfit
    END
  EXCEPTION
    when NoCleanClothes
      dirty_clothes = CALL search_for_clothes(time_to_wash = false, rush = true)
    when LaunderDirtyClothes
      clean_clothes = CALL search_for_clothes(time_to_wash = true, rush = true)
    when FeelingPressure
      EMOTIONS += 1
  END
END

def clothing_looper(clothing_options, selected_outfit)
    for i in clothing_options.length
      next iteration IF i IS NOT kind_of?(Garmet)
      IF selected_outfit.null
        CALL check_confidance with i AND clothing_options.length-i
        IF check_confidance > 75
          KEY = i.type
          selected_outfit.KEY = i
        elsif check_confidance > 75
          PUSH i to stash
        else
          NEXT
        END
      else
        IF selected_outfit KEY that EQUALS i.type IS NULL
          CALL match_checker with i AND selected_outfit
          IF match_checker = true
            KEY = i.type
            selected_outfit.KEY = i
          ELSE
            NEXT
          END
        ELSE
          NEXT
        END
      END
    END
    RETURN selected_outfit
END

def match_checker(item, outfit_hash)

  type = item.type
  FOR EACH outfit_hash.type AS outfit_item
    IF item.color ≈ outfit_item.color
      NEXT
    ELSE
      RETURN false
    END
  END
  return true
END

def search_for_clothes(time_to_wash: true, rush: false)
  bucket = []
  FOR EACH item ALONG THE WAY TO THE laundry_basket
    PUSH item TO bucket
  END
  IF time_to_wash IS FALSE AND rush IS TRUE
    JOIN laundry_basket AND bucket AS result
    RETURN result
  THEN IF time_to_wash IS TRUE AND rush IS TRUE
    RETURN launder_clothes(load, rush)
  THEN IF time_to_wash IS TRUE AND rush IS FALSE OR TRUE
    RETURN launder_clothes(load, rush)
  END
end
```

### Launder Clothes
```
def launder_clothes(load, rush)
  SELECT load AND CARRY TO washing_machine
  CALL wash_cycle(load_size, load)
  IF load_size === large
    CALL dry_cycle(load_size, load) IN 60 Minutes
  THEN IF load_size === medium
    CALL dry_cycle(load_size, load) IN 45 Minutes
  THEN IF load_size === small
    CALL dry_cycle(load_size, load) IN 30 Minutes
  ELSE
    CALL dry_cycle(load_size, load) IN 60 Minutes
  END
  RETURN CALL gather_clothes(load, rush)
end

def wash_cycle(load_size, load)
  PLACE load IN WASHER
  WASHER SELECT load_size
  WHILE WASHER != DONE
    RETURN load IF WASHER === DONE
  END
end

def dry_cycle(load_size, load)
  PLACE load IN DRYER
  DRYER SELECT load_size
  WHILE DRYER != DONE
    RETURN load IF DRYER === DONE
  END
end

def gather_clothes(load, rush)
  IF rush TRUE
    RETURN load
  ELSE
    FOR EACH item IN load
      FOLD item
      PLACE item IN laundry_basket
    END
    RETURN laundry_basket
  END
end
```