module SessionsHelper
  def log_in(person, person_type)
    session["#{person_type}_id".to_sym] = person.id
  end

  def remember(person, person_type)
    person.remember
    cookies.permanent.encrypted["#{person_type}_id".to_sym] = person.id
    cookies.permanent[:remember_token] = { value: person.remember_token, expires: 1.day.from_now.utc } 
  end

  def forget(person, person_type)
    person.forget
    cookies.delete("#{person_type}_id".to_sym)
    cookies.delete(:remember_token)
  end

  def current_person(person_type)
    person_id = "#{person_type}_id".to_sym
    if session[person_id]
      @current_person ||= person_type.capitalize.constantize.find_by(id: session[person_id])
    elsif cookies.encrypted[person_id]
      person = person_type.capitalize.constantize.find_by(id: cookies.encrypted[person_id])
      if person && person.authenticated?(:remember, cookies[:remember_token])
        log_in(person, person_type)
        @current_person = person
      end
    end
  end

  def logged_in?(person_type)
    !current_person(person_type).nil? 
  end

  def log_out(person_type)
    forget(current_person(person_type), person_type)
    person_id = "#{person_type}_id".to_sym
    session.delete(person_id)
    @current_person = nil
  end

  def current_person?(person, person_type)
    person && person == current_person(person_type)
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    # if request.get?
    session[:forwarding_url] = request.original_url 
  end
end
