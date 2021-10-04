class Corrector
  def correct_name(name)
    return name.capitalize if name.length < 11

    name[0, 10].capitalize
  end
end
