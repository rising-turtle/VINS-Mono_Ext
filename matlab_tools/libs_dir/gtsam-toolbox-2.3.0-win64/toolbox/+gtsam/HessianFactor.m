%class HessianFactor, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%HessianFactor(HessianFactor gf)
%HessianFactor()
%HessianFactor(size_t j, Matrix G, Vector g, double f)
%HessianFactor(size_t j, Vector mu, Matrix Sigma)
%HessianFactor(size_t j1, size_t j2, Matrix G11, Matrix G12, Vector g1, Matrix G22, Vector g2, double f)
%HessianFactor(size_t j1, size_t j2, size_t j3, Matrix G11, Matrix G12, Matrix G13, Vector g1, Matrix G22, Matrix G23, Vector g2, Matrix G33, Vector g3, double f)
%HessianFactor(GaussianConditional cg)
%HessianFactor(GaussianFactor factor)
%
%-------Methods-------
%assertInvariants() : returns void
%augmentedInformation() : returns Matrix
%constantTerm() : returns double
%equals(GaussianFactor lf, double tol) : returns bool
%error(VectorValues c) : returns double
%info() : returns Matrix
%information() : returns Matrix
%linearTerm() : returns Vector
%negate() : returns gtsam::GaussianFactor
%partialCholesky(size_t nrFrontals) : returns void
%print(string s) : returns void
%printKeys(string s) : returns void
%rows() : returns size_t
%size() : returns size_t
%splitEliminatedFactor(size_t nrFrontals) : returns gtsam::GaussianConditional
%
classdef HessianFactor < gtsam.GaussianFactor
  properties
    ptr_gtsamHessianFactor = 0
  end
  methods
    function obj = HessianFactor(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(672, varargin{2});
        end
        base_ptr = gtsam_wrapper(671, my_ptr);
      elseif nargin == 1 && isa(varargin{1},'gtsam.HessianFactor')
        [ my_ptr, base_ptr ] = gtsam_wrapper(673, varargin{1});
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(674);
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(675, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      elseif nargin == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(676, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 8 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'double') && isa(varargin{7},'double') && isa(varargin{8},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(677, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8});
      elseif nargin == 13 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'double') && isa(varargin{7},'double') && isa(varargin{8},'double') && isa(varargin{9},'double') && isa(varargin{10},'double') && isa(varargin{11},'double') && isa(varargin{12},'double') && isa(varargin{13},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(678, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8}, varargin{9}, varargin{10}, varargin{11}, varargin{12}, varargin{13});
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianConditional')
        [ my_ptr, base_ptr ] = gtsam_wrapper(679, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianFactor')
        [ my_ptr, base_ptr ] = gtsam_wrapper(680, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.HessianFactor constructor');
      end
      obj = obj@gtsam.GaussianFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamHessianFactor = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(681, obj.ptr_gtsamHessianFactor);
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
        gtsam_wrapper(682, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.assertInvariants');
      end
    end

    function varargout = augmentedInformation(this, varargin)
      % AUGMENTEDINFORMATION usage: augmentedInformation() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % augmentedInformation()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(683, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.augmentedInformation');
      end
    end

    function varargout = constantTerm(this, varargin)
      % CONSTANTTERM usage: constantTerm() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % constantTerm()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(684, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.constantTerm');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(GaussianFactor lf, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(GaussianFactor lf, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianFactor') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(685, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(VectorValues c) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % error(VectorValues c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(686, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.error');
      end
    end

    function varargout = info(this, varargin)
      % INFO usage: info() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % info()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(687, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.info');
      end
    end

    function varargout = information(this, varargin)
      % INFORMATION usage: information() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % information()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(688, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.information');
      end
    end

    function varargout = linearTerm(this, varargin)
      % LINEARTERM usage: linearTerm() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % linearTerm()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(689, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.linearTerm');
      end
    end

    function varargout = negate(this, varargin)
      % NEGATE usage: negate() : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % negate()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(690, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.negate');
      end
    end

    function varargout = partialCholesky(this, varargin)
      % PARTIALCHOLESKY usage: partialCholesky(size_t nrFrontals) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % partialCholesky(size_t nrFrontals)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(691, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.partialCholesky');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(692, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.print');
      end
    end

    function varargout = printKeys(this, varargin)
      % PRINTKEYS usage: printKeys(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % printKeys(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(693, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.printKeys');
      end
    end

    function varargout = rows(this, varargin)
      % ROWS usage: rows() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % rows()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(694, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.rows');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(695, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.size');
      end
    end

    function varargout = splitEliminatedFactor(this, varargin)
      % SPLITELIMINATEDFACTOR usage: splitEliminatedFactor(size_t nrFrontals) : returns gtsam::GaussianConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % splitEliminatedFactor(size_t nrFrontals)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(696, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.HessianFactor.splitEliminatedFactor');
      end
    end

  end

  methods(Static = true)
  end
end
