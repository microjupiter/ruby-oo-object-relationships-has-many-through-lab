class Doctor
    attr_accessor :name
  
    @@all = []
  
    def initialize(name)
      @name = name
      @@all << self
    end

    def appointments
        Appointment.all.select do |a|
            a.doctor == self
        end
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def self.all
        @@all
    end

    def patients
        appointments.map(&:patient)
      end
end
