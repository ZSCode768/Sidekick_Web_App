require "application_system_test_case"

class CharactersTest < ApplicationSystemTestCase
  setup do
    @character = characters(:one)
  end

  test "visiting the index" do
    visit characters_url
    assert_selector "h1", text: "Characters"
  end

  test "should create character" do
    visit characters_url
    click_on "New character"

    fill_in "Name", with: "New Character"
    fill_in "Level", with: 5
    fill_in "Character Class", with: "Eldritch Vessel"
    fill_in "Description", with: "Hello there"
    fill_in "Strength", with: 10
    fill_in "Dexterity", with: 10
    fill_in "Constitution", with: 10
    fill_in "Intelligence", with: 10
    fill_in "Wisdom", with: 10
    fill_in "Charisma", with: 10
    fill_in "Abilities", with: "Special Skills"
    click_on "Create Character"

    assert_text "Character was successfully created"
    click_on "Back"
  end

  test "should update Character" do
    visit character_url(@character)
    click_on "Edit this character", match: :first

    fill_in "Name", with: "Updated Character"
    fill_in "Level", with: 6
    fill_in "Character Class", with: "Eldritch Vessel"
    fill_in "Description", with: "Updated description"
    fill_in "Strength", with: 12
    fill_in "Dexterity", with: 11
    fill_in "Constitution", with: 13
    fill_in "Intelligence", with: 14
    fill_in "Wisdom", with: 12
    fill_in "Charisma", with: 10
    fill_in "Abilities", with: "Updated abilities"
    click_on "Update Character"

    assert_text "Character was successfully updated"
    click_on "Back"
  end

  test "should destroy Character" do
    visit character_url(@character)
    click_on "Destroy this character", match: :first

    assert_text "Character was successfully destroyed"
  end
end
