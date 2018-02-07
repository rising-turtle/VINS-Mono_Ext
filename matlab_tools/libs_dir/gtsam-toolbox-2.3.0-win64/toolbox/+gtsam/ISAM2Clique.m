%class ISAM2Clique, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ISAM2Clique(GaussianConditional conditional)
%
%-------Methods-------
%clone() : returns gtsam::ISAM2Clique
%gradientContribution() : returns Vector
%permuteWithInverse(Permutation inversePermutation) : returns void
%print(string s) : returns void
%
classdef ISAM2Clique < handle
  properties
    ptr_gtsamISAM2Clique = 0
  end
  methods
    function obj = ISAM2Clique(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1163, varargin{2});
        end
        gtsam_wrapper(1162, my_ptr);
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianConditional')
        my_ptr = gtsam_wrapper(1164, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.ISAM2Clique constructor');
      end
      obj.ptr_gtsamISAM2Clique = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1165, obj.ptr_gtsamISAM2Clique);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = clone(this, varargin)
      % CLONE usage: clone() : returns gtsam::ISAM2Clique
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clone()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1166, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Clique.clone');
      end
    end

    function varargout = gradientContribution(this, varargin)
      % GRADIENTCONTRIBUTION usage: gradientContribution() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % gradientContribution()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1167, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Clique.gradientContribution');
      end
    end

    function varargout = permuteWithInverse(this, varargin)
      % PERMUTEWITHINVERSE usage: permuteWithInverse(Permutation inversePermutation) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % permuteWithInverse(Permutation inversePermutation)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Permutation')
        gtsam_wrapper(1168, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Clique.permuteWithInverse');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1169, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Clique.print');
      end
    end

  end

  methods(Static = true)
  end
end
