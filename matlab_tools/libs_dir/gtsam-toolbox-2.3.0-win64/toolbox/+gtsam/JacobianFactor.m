%class JacobianFactor, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%JacobianFactor()
%JacobianFactor(Vector b_in)
%JacobianFactor(size_t i1, Matrix A1, Vector b, Diagonal model)
%JacobianFactor(size_t i1, Matrix A1, size_t i2, Matrix A2, Vector b, Diagonal model)
%JacobianFactor(size_t i1, Matrix A1, size_t i2, Matrix A2, size_t i3, Matrix A3, Vector b, Diagonal model)
%JacobianFactor(GaussianFactor factor)
%
%-------Methods-------
%assertInvariants() : returns void
%augmentedInformation() : returns Matrix
%cols() : returns size_t
%eliminate(size_t nrFrontals) : returns gtsam::GaussianConditional
%eliminate(size_t nFrontals) : returns gtsam::GaussianConditional
%eliminateFirst() : returns gtsam::GaussianConditional
%eliminateFirst() : returns gtsam::GaussianConditional
%empty() : returns bool
%equals(GaussianFactor lf, double tol) : returns bool
%error(VectorValues c) : returns double
%error_vector(VectorValues c) : returns Vector
%getA() : returns Matrix
%getb() : returns Vector
%information() : returns Matrix
%isConstrained() : returns bool
%matrix() : returns pair< Matrix, Vector >
%matrix_augmented() : returns Matrix
%negate() : returns gtsam::GaussianFactor
%numberOfRows() : returns size_t
%print(string s) : returns void
%printKeys(string s) : returns void
%rows() : returns size_t
%setModel(bool anyConstrained, Vector sigmas) : returns void
%size() : returns size_t
%splitConditional(size_t nFrontals) : returns gtsam::GaussianConditional
%transposeMultiplyAdd(double alpha, Vector e, VectorValues x) : returns void
%unweighted_error(VectorValues c) : returns Vector
%whiten() : returns gtsam::JacobianFactor
%
classdef JacobianFactor < gtsam.GaussianFactor
  properties
    ptr_gtsamJacobianFactor = 0
  end
  methods
    function obj = JacobianFactor(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(635, varargin{2});
        end
        base_ptr = gtsam_wrapper(634, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(636);
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(637, varargin{1});
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'gtsam.noiseModel.Diagonal')
        [ my_ptr, base_ptr ] = gtsam_wrapper(638, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      elseif nargin == 6 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'numeric') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'gtsam.noiseModel.Diagonal')
        [ my_ptr, base_ptr ] = gtsam_wrapper(639, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      elseif nargin == 8 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'numeric') && isa(varargin{4},'double') && isa(varargin{5},'numeric') && isa(varargin{6},'double') && isa(varargin{7},'double') && isa(varargin{8},'gtsam.noiseModel.Diagonal')
        [ my_ptr, base_ptr ] = gtsam_wrapper(640, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8});
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianFactor')
        [ my_ptr, base_ptr ] = gtsam_wrapper(641, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.JacobianFactor constructor');
      end
      obj = obj@gtsam.GaussianFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamJacobianFactor = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(642, obj.ptr_gtsamJacobianFactor);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = assertInvariants(this, varargin)
      % ASSERTINVARIANTS usage: assertInvariants() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % assertInvariants()
      if length(varargin) == 0
        gtsam_wrapper(643, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.assertInvariants');
      end
    end

    function varargout = augmentedInformation(this, varargin)
      % AUGMENTEDINFORMATION usage: augmentedInformation() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % augmentedInformation()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(644, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.augmentedInformation');
      end
    end

    function varargout = cols(this, varargin)
      % COLS usage: cols() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % cols()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(645, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.cols');
      end
    end

    function varargout = eliminate(this, varargin)
      % ELIMINATE usage: eliminate(size_t nrFrontals),  eliminate(size_t nFrontals) : returns gtsam::GaussianConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % eliminate(size_t nrFrontals)
      % eliminate(size_t nFrontals)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(646, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(647, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.eliminate');
      end
    end

    function varargout = eliminateFirst(this, varargin)
      % ELIMINATEFIRST usage: eliminateFirst(),  eliminateFirst() : returns gtsam::GaussianConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % eliminateFirst()
      % eliminateFirst()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(648, this, varargin{:});
      elseif length(varargin) == 0
        varargout{1} = gtsam_wrapper(649, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.eliminateFirst');
      end
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % empty()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(650, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.empty');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(GaussianFactor lf, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(GaussianFactor lf, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianFactor') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(651, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(VectorValues c) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % error(VectorValues c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(652, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.error');
      end
    end

    function varargout = error_vector(this, varargin)
      % ERROR_VECTOR usage: error_vector(VectorValues c) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % error_vector(VectorValues c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(653, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.error_vector');
      end
    end

    function varargout = getA(this, varargin)
      % GETA usage: getA() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getA()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(654, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.getA');
      end
    end

    function varargout = getb(this, varargin)
      % GETB usage: getb() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getb()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(655, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.getb');
      end
    end

    function varargout = information(this, varargin)
      % INFORMATION usage: information() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % information()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(656, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.information');
      end
    end

    function varargout = isConstrained(this, varargin)
      % ISCONSTRAINED usage: isConstrained() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isConstrained()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(657, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.isConstrained');
      end
    end

    function varargout = matrix(this, varargin)
      % MATRIX usage: matrix() : returns pair< Matrix, Vector >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % matrix()
      if length(varargin) == 0
        [ varargout{1} varargout{2} ] = gtsam_wrapper(658, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.matrix');
      end
    end

    function varargout = matrix_augmented(this, varargin)
      % MATRIX_AUGMENTED usage: matrix_augmented() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % matrix_augmented()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(659, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.matrix_augmented');
      end
    end

    function varargout = negate(this, varargin)
      % NEGATE usage: negate() : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % negate()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(660, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.negate');
      end
    end

    function varargout = numberOfRows(this, varargin)
      % NUMBEROFROWS usage: numberOfRows() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % numberOfRows()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(661, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.numberOfRows');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(662, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.print');
      end
    end

    function varargout = printKeys(this, varargin)
      % PRINTKEYS usage: printKeys(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % printKeys(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(663, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.printKeys');
      end
    end

    function varargout = rows(this, varargin)
      % ROWS usage: rows() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % rows()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(664, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.rows');
      end
    end

    function varargout = setModel(this, varargin)
      % SETMODEL usage: setModel(bool anyConstrained, Vector sigmas) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setModel(bool anyConstrained, Vector sigmas)
      if length(varargin) == 2 && isa(varargin{1},'logical') && isa(varargin{2},'double')
        gtsam_wrapper(665, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.setModel');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(666, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.size');
      end
    end

    function varargout = splitConditional(this, varargin)
      % SPLITCONDITIONAL usage: splitConditional(size_t nFrontals) : returns gtsam::GaussianConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % splitConditional(size_t nFrontals)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(667, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.splitConditional');
      end
    end

    function varargout = transposeMultiplyAdd(this, varargin)
      % TRANSPOSEMULTIPLYADD usage: transposeMultiplyAdd(double alpha, Vector e, VectorValues x) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % transposeMultiplyAdd(double alpha, Vector e, VectorValues x)
      if length(varargin) == 3 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'gtsam.VectorValues')
        gtsam_wrapper(668, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.transposeMultiplyAdd');
      end
    end

    function varargout = unweighted_error(this, varargin)
      % UNWEIGHTED_ERROR usage: unweighted_error(VectorValues c) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % unweighted_error(VectorValues c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(669, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.unweighted_error');
      end
    end

    function varargout = whiten(this, varargin)
      % WHITEN usage: whiten() : returns gtsam::JacobianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % whiten()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(670, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JacobianFactor.whiten');
      end
    end

  end

  methods(Static = true)
  end
end
