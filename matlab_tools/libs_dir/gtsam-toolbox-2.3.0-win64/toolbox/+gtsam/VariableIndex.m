%class VariableIndex, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%VariableIndex()
%VariableIndex(SymbolicFactorGraph factorGraph)
%VariableIndex(SymbolicFactorGraph factorGraph, size_t nVariables)
%VariableIndex(GaussianFactorGraph factorGraph)
%VariableIndex(GaussianFactorGraph factorGraph, size_t nVariables)
%VariableIndex(NonlinearFactorGraph factorGraph)
%VariableIndex(NonlinearFactorGraph factorGraph, size_t nVariables)
%VariableIndex(VariableIndex other)
%
%-------Methods-------
%equals(VariableIndex other, double tol) : returns bool
%nEntries() : returns size_t
%nFactors() : returns size_t
%permuteInPlace(Permutation permutation) : returns void
%print(string s) : returns void
%size() : returns size_t
%
classdef VariableIndex < handle
  properties
    ptr_gtsamVariableIndex = 0
  end
  methods
    function obj = VariableIndex(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(468, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(469);
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicFactorGraph')
        my_ptr = gtsam_wrapper(470, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'gtsam.SymbolicFactorGraph') && isa(varargin{2},'numeric')
        my_ptr = gtsam_wrapper(471, varargin{1}, varargin{2});
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianFactorGraph')
        my_ptr = gtsam_wrapper(472, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'gtsam.GaussianFactorGraph') && isa(varargin{2},'numeric')
        my_ptr = gtsam_wrapper(473, varargin{1}, varargin{2});
      elseif nargin == 1 && isa(varargin{1},'gtsam.NonlinearFactorGraph')
        my_ptr = gtsam_wrapper(474, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'numeric')
        my_ptr = gtsam_wrapper(475, varargin{1}, varargin{2});
      elseif nargin == 1 && isa(varargin{1},'gtsam.VariableIndex')
        my_ptr = gtsam_wrapper(476, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.VariableIndex constructor');
      end
      obj.ptr_gtsamVariableIndex = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(477, obj.ptr_gtsamVariableIndex);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = equals(this, varargin)
      % EQUALS usage: equals(VariableIndex other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(VariableIndex other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.VariableIndex') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(478, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VariableIndex.equals');
      end
    end

    function varargout = nEntries(this, varargin)
      % NENTRIES usage: nEntries() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % nEntries()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(479, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VariableIndex.nEntries');
      end
    end

    function varargout = nFactors(this, varargin)
      % NFACTORS usage: nFactors() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % nFactors()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(480, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VariableIndex.nFactors');
      end
    end

    function varargout = permuteInPlace(this, varargin)
      % PERMUTEINPLACE usage: permuteInPlace(Permutation permutation) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % permuteInPlace(Permutation permutation)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Permutation')
        gtsam_wrapper(481, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VariableIndex.permuteInPlace');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(482, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VariableIndex.print');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(483, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VariableIndex.size');
      end
    end

  end

  methods(Static = true)
  end
end
